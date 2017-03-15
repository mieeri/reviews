class TweetsController < ApplicationController
   def show
    # @tweets = TwitterClient.get_client.search("#" + "#{@dorama.hash_tag} -rt",lang: "ja").take(2)
  end
end
