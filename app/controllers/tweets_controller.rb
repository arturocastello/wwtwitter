class TweetsController < ApplicationController
	def new 
		@tweet = Tweet.new
	end

	def create
		@tweet = Tweet.new(tweet_params)
		@tweet.save

		redirect_to new_tweet_path
	end

	private

	def tweet_params
		params.require(:tweet).permit(:content)
	end

end