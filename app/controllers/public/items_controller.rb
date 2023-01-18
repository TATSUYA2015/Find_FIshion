class Public::ItemsController < ApplicationController

  def show
    @item=Item.find(params[:id])
    @comment=Comment.new
  end

#いいね一覧
  def favorites
    #いいね　where→ログインしてるcustomer pluck→itemを配列から検索
    favorites= Favorite.where(customer_id: current_customer.id).pluck(:item_id)
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
