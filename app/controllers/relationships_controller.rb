class RelationshipsController < ApplicationController
  def create
    #follow = current_user.relationships.build(follower_id: params[:user_id])
    follow = Relationship.new()
    follow.follower_id = params[:user_id]
    follow.following_id = current_user.id
    follow.save
    redirect_to users_path
  end

  def destroy
    #follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow = Relationship.find_by(follower_id: params[:user_id], following_id: current_user.id)
    follow.destroy
    redirect_to root_path
  end
end
