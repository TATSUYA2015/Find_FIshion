class PostAdmin::ItemsController < ApplicationController
  def index
    @item=Item.new
    @items=Item.all
    @contributor=Contributor.new
  end

  def new
    @item=Item.new
  end

  def create
    @item=Item.new(item_params)
    @item.contributor_id = current_contributor.id
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
    item=Item.find(params[:id])
    item.destroy
    redirect_to post_admin_items_path
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :image, :introduction)
  end
end

