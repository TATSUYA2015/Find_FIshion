class Public::ItemsController < ApplicationController

  def show
    @item=Item.find(params[:id])
    @comment=Comment.new
  end


  def favorites
    @item = Item.find(params[:id])
    favorites= Favorite.where(item_id: @item.id).pluck(:customer_id)
    @favorite_items = Item.find(favorites)
  end


  private

  def item_params
    params.require(:item).permit(:contributor_id, :genre_id, :name, :image, :introduction)
  end

  def comment_params
    params.require(:comment).permit(:item_id, :customer_id, :introduction)
  end

end
