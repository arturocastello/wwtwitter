class TweetsController < ApplicationController

	before_action :authenticate_user!

	def new 
		@tweet = Tweet.new
	end

	def create
		@tweet = Tweet.new(tweet_params)
		@tweet.user = current_user
		if @tweet.save
			flash[:success] = "You have created a new tweet"
		else
			flash[:danger] = "Tweet must be shorter"
		end
		redirect_to new_tweet_path
	end

	private

	def tweet_params
		params.require(:tweet).permit(:content)
	end

end