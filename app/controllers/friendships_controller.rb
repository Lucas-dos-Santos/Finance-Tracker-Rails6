class FriendshipsController < ApplicationController
  def create
    friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: friend.id)
    if current_user.save
      flash[:notice] = "Seguindo #{friend.full_name}"
    else
      flash[:alert] = 'Oops, Algo errado!'
    end
    redirect_to friends_path
  end

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    friendship.destroy
    flash[:notice] = "Deixou de seguir #{User.find(params[:id]).full_name}"
    redirect_to friends_path
  end
end
