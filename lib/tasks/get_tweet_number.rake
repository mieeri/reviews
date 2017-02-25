require 'logger'
require 'twitter'

namespace :tweet do

  desc "get tweet number store them in DB"
  task :get_tweet_number => :environment do
    doramas = Dorama.all
    doramas.each do |dorama|
      Rails.logger.debug("ドラマ " + dorama.title)
      tweets_number = 0
      query = "#" + dorama.hash_tag
      max_id = TwitterClient.get_client.search(query, lang: "ja", result_type:"recent", count: 1, exclude: "retweets").first.id
      while true do
        tweets = TwitterClient.get_client.search(query, lang: "ja", result_type:"recent", max_id: max_id, count: 20, exclude: "retweets")
        tweets_number += tweets.count
        max_id = tweets.last.id
        Rails.logger.debug("max_id " + max_id.to_s)
        break if tweets.count < 20
        Rails.logger.debug("TWEETカウント " + tweets.count.to_s)
        sleep 60
      end
      dorama.tweet_number = tweets_number
      dorama.save
    end
  end
end
