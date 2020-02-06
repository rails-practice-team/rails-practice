class TweetsController < ApplicationController
  def top
  end

  def index
    @tweets = Tweet.all
  end

  def show
  end

  def edit
  end
end
