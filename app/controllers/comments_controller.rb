class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
        if @comment.save
            redirect_to tweet_path(@comment.tweet_id)
        else
            @tweet = Tweet.find(params[:tweet_id])
            render 'tweets/show'
        end
    end
    def destroy
    end
    private
    def comment_params
        params.require(:comment).permit(:context, :tweet_id, :user_id)
    end
end
