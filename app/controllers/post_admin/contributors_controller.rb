class PostAdmin::ContributorsController < ApplicationController
  def show
    @contributor=Contributor.find(params[:id])
  end

  def edit
     @contributor=Contributor.find(params[:id])
  end

  def update
  end

  private

  def contributor_paramas
    params.require(:contributor).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :brand_name, :email, :postal_code, :address, :telephone_number)
  end
end
