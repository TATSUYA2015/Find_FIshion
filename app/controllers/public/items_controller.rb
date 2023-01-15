class Public::ItemsController < ApplicationController
  def index
  end

  def show
    @item=Item.find(params[:id])
    @comment=Comment.new
  end

  private

  def item_params
    params.require(:item).permit(:contributor_id, :genre_id, :name, :image, :introduction)
  end

  def comment_params
    params.require(:comment).permit(:item_id, :customer_id, :comment)
  end

end
