class Public::RelationshipsController < ApplicationController
  before_action :authenticate_customer!
  #フォローする
  def create
    following=current_customer.relationships.build(following_id: current_customer.id, follower_id: params[:contributor_id])
    following.save
    redirect_to request.referrer || root_path
  end
  #フォロー解除
  def destroy
    following=current_customer.relationships.find_by(following_id: current_customer.id, follower_id: params[:contributor_id])
    following.destroy
    redirect_to request.referrer || root_path
  end

  def followings
    customer = customer.find(params[:customer_id])
    @customers = customer.followings
  end

  #def create
  #@post_favorite = Favorite.new(user_id: current_user.id, post_id: params[:post_id])
  #@post_favorite.save
  #redirect_to post_path(params[:post_id])
  #end

end
