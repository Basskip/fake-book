class FriendRequestsController < ApplicationController

  def create
    @user = User.find(params[:receiver_id])
    if @user.requested_friends.include?(current_user)
      @user.outgoing_friend_requests.find_by(receiver: current_user).accept
    else
      current_user.requested_friends << @user
    end
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
