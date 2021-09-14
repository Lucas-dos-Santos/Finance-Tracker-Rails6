class FriendshipsController < ApplicationController
  def create
    byebug
  end

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    friendship.destroy
    flash[:notice] = 'Deixou de seguir'
    redirect_to friends_path
  end
end
