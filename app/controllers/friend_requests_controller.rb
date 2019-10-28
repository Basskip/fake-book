class FriendRequestsController < ApplicationController

  def create
    @user = User.find(params[:receiver_id])
    current_user.request_friend(@user)
    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.js
    end
  end

  def destroy
    if params[:decline]
      @user = FriendRequest.find(params[:id]).sender
      current_user.requesting_friends.delete(@user) if current_user.requesting_friends.include?(@user)
    else
      @user = FriendRequest.find(params[:id]).receiver
      current_user.requested_friends.delete(@user)
    end
    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.js
    end
  end
end
