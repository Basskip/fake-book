class LikesController < ApplicationController

    def create
        @post = Post.find(params[:like][:post_id])
        current_user.like(@post)
        respond_to do |format|
            format.html { redirect_to request.referrer }
            format.js
        end
    end
    
    def destroy
        @post = Post.find(params[:like][:post_id])
        current_user.unlike(@post)
        respond_to do |format|
            format.html { redirect_to request.referrer }
            format.js
        end
    end
end
