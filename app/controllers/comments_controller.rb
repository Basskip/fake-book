class CommentsController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        @comment = Comment.new(user: current_user, post: @post, body: params[:comment][:body])
        if @comment.save
            flash[:success] = "Comment posted!"
        end
        redirect_to request.referrer || root_url
    end

    def destroy
        @comment = Comment.find_by(user: current_user, id: params[:id])
        if @comment
            @comment.destroy
            redirect_to request.referrer || root_url
        else
            redirect_to root_url
        end
    end

    def index
        @comments = Post.find(params[:post_id]).comments
    end
end
