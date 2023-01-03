class WebAdmin::ContributorsController < ApplicationController
  def index
    @contributors=Contributor.all
  end

  def show
    @contributor=Contributor.find(params[:id])
    @items=Item.all
  end

  def edit
    @contributor=Contributor.find(params[:id])
  end

  def update
    contributor=Contributor.find(params[:id])
    contributor.update(contributor_paramas)
    redirect_to web_admin_contributor_path
  end

  private

  def contributor_paramas
    params.require(:contributor).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :brand_name, :get_profile_image, :profile_image, :email, :postal_code, :address, :telephone_number)
  end

end
