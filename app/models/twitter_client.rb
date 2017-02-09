require 'twitter'
require 'active_record'

class TwitterClient
  def self.get_client
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
    end

    client
  end
end