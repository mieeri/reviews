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
      tweets = TwitterClient.get_client.search(query, lang: "ja", result_type:"recent", count: 2, exclude: "retweets")
      tweets_number = tweets.count
      dorama.tweet_number = tweets_number
      dorama.save
    end
  end
end
