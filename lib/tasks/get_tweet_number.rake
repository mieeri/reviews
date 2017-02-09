require 'logger'

namespace :tweet do

  desc "get tweet number store them in DB"
  task :get_tweet_number => :environment do
    Rails.logger.debug "私ちゃぬえり"

    doramas = Dorama.all
    doramas.each do |dorama|
      tweets = TwitterClient.get_client.search("#" + "#{dorama.hash_tag} -rt", lang: "ja")
      dorama.tweet_number = tweets.count
      dorama.save
    end
  end
end



