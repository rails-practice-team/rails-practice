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
    def edit
        @comment = Comment.find(params[:id])
        if  @comment.user_id != current_user.id
            redirect_to tweet_path(@comment.tweet_id.to_i)
        end
    end
    def update
        @comment = Comment.find(params[:id])
        if @comment.update(comment_params)
            redirect_to tweet_path(@comment.tweet_id.to_i)
        else
            @comment = Comment.find(params[:id])
            render :edit
        end
    end
    def destroy
        @comment = Comment.find(params[:id])
        number = @comment.tweet_id
        if @comment.destroy
          redirect_to tweet_path(number)
        else
          @comment = Comment.find(params[:id])
          render :edit
        end
    end
    private
    def comment_params
        params.require(:comment).permit(:context, :tweet_id, :user_id)
    end
end
