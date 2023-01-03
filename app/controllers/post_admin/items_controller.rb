class PostAdmin::ItemsController < ApplicationController
  def index
    @item=Item.new
    @items=Item.all
  end

  def new
    @item=Item.new
  end

  def create
    @item=Item.new(item_params)
    @item.save
    redirect_to post_admin_item_path(@item.id)
  end

  def show
    @item=Item.find(params[:id])
  end

  def edit
    @item=Item.find(params[:id])
  end

  def update
    item=Item.find(params[:id])
    item.update(item_params)
    redirect_to post_admin_item_path
  end

  def destroy
    item=Item.find(params[:id])
    item.destroy
    redirect_to post_admin_items_path
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :introduction)
  end

end

