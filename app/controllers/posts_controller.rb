class PostsController < ApplicationController
    before_action :correct_user, only: :destroy

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(posts_params)
        if @post.save
            flash[:success] = 'Post created!'
            redirect_to @post
        else
            render 'new'
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def index
        friend_ids = "SELECT friend_id FROM friendships WHERE user_id = :user_id"
        @posts = Post.where("user_id IN (#{friend_ids}) OR user_id = :user_id", user_id: current_user.id )
    end

    def destroy
        @post.destroy
        flash[:success] = 'Post deleted'
        redirect_to request.referrer || root_url
    end

    private

    def posts_params
        params.require(:post).permit(:body)
    end

    def correct_user
        @post = current_user.posts.find_by(id: params[:id])
        redirect_to root_url if @post.nil?
    end
end
