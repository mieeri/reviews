class TweetsController < ApplicationController
  def index
    @tweets = TwitterClient.get_client.search("#小さな巨人", lang: "ja", result_type: "recent", since_id: 0, exclude: "retweets").take(20)
  end
end
