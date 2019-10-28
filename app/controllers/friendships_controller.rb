class FriendshipsController < ApplicationController

    def destroy
        @user = Friendship.find(params[:id]).friend
        current_user.friends.destroy(@user)
    end
end
