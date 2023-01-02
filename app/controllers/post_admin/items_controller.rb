class PostAdmin::ItemsController < ApplicationController
  def index
    @items=Item.all
  end

  def new
    @item=Item.new
  end

  def create
    @item=Item.new(item_params)
    @items=Item.all
    if @item.save
      redirect_to post_admin_item_path(@item.id)
    else
      render new_post_admin_item_path
    end
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
    @item=Item.find(params[:id])
    @item.destroy
    redirect_to post_admin_homes_top_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction)
  end

end
