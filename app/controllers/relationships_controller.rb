class RelationshipsController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @follows = Relationship.where(following_id: @user.id)
    @followed = Relationship.where(follower_id: @user.id)
  end
  def create
    follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
    redirect_to musics_path
  end

  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    redirect_to musics_path
  end
  private
  def user_params
        params.require(:user).permit(:name, :image)
  end
end
