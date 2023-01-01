class PostAdmin::ItemsController < ApplicationController
  def index
    @items=Item.all
  end

  def new
    @item=Item.new
  end

  def create
    @item=Item.new(item_params)
    @item.save
    redirect_to post_admin_items_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction)
  end

end
