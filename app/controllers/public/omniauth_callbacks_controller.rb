# frozen_string_literal: true

class Public::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:

   # callback for twitter
  def twitter
    callback_from :twitter
  end

  # callback for google
  def google_oauth2
    callback_from :google
  end

  def callback_from(provider)
  provider = provider.to_s

  @customer = Customer.find_for_oauth(request.env['omniauth.auth'])

  # persisted?でDBに保存済みかどうか判断
    if @customer.persisted?
      # サインアップ時に行いたい処理があればここに書きます。
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      sign_in_and_redirect @customer, event: :authentication
    else
      session["devise.#{provider}_data"] = request.env['omniauth.auth']
      redirect_to new_customer_session_path
    end
  end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
