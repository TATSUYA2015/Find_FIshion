class Public::CustomersController < ApplicationController
    before_action :ensure_customer, only:[:show, :edit, :update, :unsubscribe]

  def show
    #↓フォローしている人全員を持ってくる＝フォローしている人全員の中から投稿者の退会が有効な人を絞り込んでいるという記述
    @customer_followings = @customer.followings.where(is_deleted: false)
  end

  def edit
  end

  def update
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
    @contributors=customer.followings.where(is_deleted: false)
  end

  def favorites
    @items=Item.all
    @customer = Customer.find(params[:id])
    favorites= Favorite.with_active_contributor.where(customer_id: @customer.id).pluck(:item_id)
    @favorite_items = Item.find(favorites)
  end

  private

  def ensure_customer
    @customer=Customer.find(params[:id])
    redirect_to root_path unless current_customer.id == @customer.id
  end


  def customer_params
    params.require(:customer).permit(:name, :account, :profile_image , :email, :telephone_number,:following_id)
  end


end

