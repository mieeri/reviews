require 'logger'
require 'twitter'

namespace :tweet do
  desc "get tweet number store them in DB"
  task :get_tweet_number => :environment do
    Rails.logger.debug("get_tweet_number")
    doramas = Dorama.all
    doramas.each do |dorama|
      Rails.logger.debug("each内ドラマ " + dorama.title)
      query = "#" + dorama.hash_tag
      client = TwitterClient.get_client
      tweets = client.search(query, lang: "ja", result_type:"recent", count: 100, exclude: "retweets").take(10000)
      max_id = tweets.last.id
      while tweets.count == 10000
        tweets = client.search(query, lang: "ja", result_type:"recent", count: 100, exclude: "retweets", max_id: max_id).take(10000)
        max_id = tweets.last.id
        Rails.logger.debug("#{dorama.title}のmax_id: " + max_id.to_s)
        result += tweets
      end
      dorama.tweet_number = tweets.count
      dorama.save
    end
  end
end
