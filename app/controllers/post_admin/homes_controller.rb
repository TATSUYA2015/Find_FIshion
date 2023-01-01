class PostAdmin::HomesController < ApplicationController
  def top
    @contributor=Contributor.new
    @items=Item.all
  end

  private

  def contributor_paramas
    params.require(:contributor).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :brand_name, :get_profile_image, :profile_image, :email, :postal_code, :address, :telephone_number)
  end

  def item_params
    params.require(:item).permit(:name, :image, :introduction)
  end

end
