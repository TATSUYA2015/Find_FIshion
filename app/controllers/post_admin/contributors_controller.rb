class PostAdmin::ContributorsController < ApplicationController
  def show
    @contributor=Contributor.find(params[:id])
    @contributors=Contributor.where.not(id: current_contributor.id)
  end

  def edit
    @contributor=Contributor.find(params[:id])
  end

  def update
    contributor=Contributor.find(params[:id])
    contributor.update(contributor_paramas)
    redirect_to  post_admin_contributor_path(current_contributor.id)
  end

  def withdrawal
    @contributor=Contributor.find(params[:id])
    @contributor.update(is_deleted: true)
    reset_session
    redirect_to new_contributor_session_path
  end

  def followers
    contributor=Contributor.find(params[:id])
    @customers=contributor.followers
  end

  private

  def contributor_paramas
    params.require(:contributor).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :brand_name, :get_profile_image, :profile_image, :email, :postal_code, :address, :telephone_number, :introduction, :is_deleted)
  end
end
