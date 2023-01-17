class WebAdmin::ItemsController < ApplicationController

  def show
    @item=Item.find(params[:id])
  end

  def edit
    @item=Item.find(params[:id])
  end

  def update
    item=Item.find(params[:id])
    item.update(item_params)
    redirect_to web_admin_item_path
  end

  def destroy
    item=Item.find(params[:id])
    item.destroy
    redirect_to  web_admin_contributor_path
  end


  private

  def item_params
   params.require(:item).permit(:genre_id, :name, :image, :introduction)
  end

end
