class TweetsController < ApplicationController
  def top
  end

  def index
    @tweets = Tweet.all.reverse_order
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.reverse_order
    @comment = Comment.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      flash[:notice] = "投稿しました"
      redirect_to tweet_path(@tweet)
    else
      flash[:notice] = "投稿に失敗しました"
      redirect_back(fallback_location: user_path(current_user))
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
    if @tweet.user_id != current_user.id
      redirect_to user_path(current_user)
    end
  end
  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to tweet_path(@tweet)
    else
      @tweet = Tweet.find(params[:id])
      render :edit
    end
  end
  def destroy
    @tweet = Tweet.find(params[:id])
    if @tweet.destroy
      redirect_to tweets_path
    else
      @tweet = Tweet.find(params[:id])
      render :edit
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:context)
  end
end
