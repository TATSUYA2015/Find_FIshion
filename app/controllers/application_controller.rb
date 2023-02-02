class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when WebAdmin
      web_admin_homes_top_path
    when Contributor
      post_admin_items_path
    when Customer
      root_path
    end
  end

   def after_sign_out_path_for(resource)
    if resource == :web_admin
      new_web_admin_session_path
    else
      root_path
    end
   end

   def after_sign_out_path_for(resource)
    if resource == :post_admin
      new_contributor_session_path
    else
      root_path
    end
   end

   def after_sign_out_path_for(resource)
    if resource == :public
      new_customer_session_path
    else
      root_path
    end
   end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :first_name, :last_name_kana, :first_name_kana,:account , :brand_name, :profile_image, :postal_code, :address, :telephone_number, :email, :encrypted_password])
  end

end
