class Public::CustomersController < ApplicationController
  def show
    @customer=Customer.find(params[:id])
    @customers=Customer.where.not(id: current_customer.id)
  end

  def edit
    @customer=Customer.find(params[:id])
  end

  def update
    @customer=Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path
  end


  def unsubscribe
  end

  def withdrawal
    @customer=Customer.find(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def followings
    customer=Customer.find(params[:id])
    @contributors=customer.followings
  end


  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :account,:get_profile_image , :email, :postal_code, :address, :telephone_number)
  end

  def contributor_paramas
    params.require(:contributor).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :brand_name, :get_profile_image, :profile_image, :email, :postal_code, :address, :telephone_number)
  end

end
