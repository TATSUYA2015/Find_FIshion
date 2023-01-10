class Public::ContributorController < ApplicationController
  def show
    @contributor=Contributor.find(params[:id])
    @customer=current_customer.id
  end


  #def followings
    #customer=Customer.find(params[:id])
    #@contributors=customer.followings
  #end

  def followers
    contributor = Contributor.find(params[:id])
    @customer = contributor.followers
  end





  private

  def contributor_paramas
    params.require(:contributor).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :brand_name, :get_profile_image, :profile_image, :email, :postal_code, :address, :telephone_number)
  end

end
