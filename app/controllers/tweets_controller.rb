class TweetsController < ApplicationController
	def new 
		@tweet = Tweet.new
	end

	def create
		@tweet = Tweet.new(tweet_params)
		@tweet.save

		flash[:success] = "You have created a new tweet"

		redirect_to new_tweet_path
	end

	private

	def tweet_params
		params.require(:tweet).permit(:content)
	end

end