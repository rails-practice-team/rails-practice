class TweetsController < ApplicationController
  def top
  end

  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @tweet = Tweet.find(params[:id])
    if @tweet.user_id != current_user.id
      redirect_to user_path(current_user)
    end
  end
end
