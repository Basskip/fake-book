class FriendRequestsController < ApplicationController

  def create
    @user = User.find(params[:receiver_id])
    current_user.requested_friends << @user
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = FriendRequest.find(params[:id]).receiver
    current_user.requested_friends.delete(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end
