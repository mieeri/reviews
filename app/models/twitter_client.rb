require 'twitter'
require 'active_record'

class TwitterClient
  def self.get_client
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
    end

  def rate_limit_status_search_tweets(client)
  client.__send__(:perform_get, '/1.1/application/rate_limit_status.json')[:resources][:search][:"/search/tweets"]
  end

    client
  end
end