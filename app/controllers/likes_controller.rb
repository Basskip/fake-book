class LikesController < ApplicationController

    def create
        @post = Post.find(params[:post_id])
        current_user.like(@post)
        respond_to do |format|
            format.html { redirect_to request.referrer }
            format.js
        end
    end
    
    def destroy
        @post = Post.find(params[:post_id])
        current_user.unlike(@post)
        respond_to do |format|
            format.html { redirect_to request.referrer }
            format.js
        end
    end

    def index
        @likes = Post.find(params[:post_id]).likes
    end
end
