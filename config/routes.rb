Rails.application.routes.draw do

  devise_for :post_admins
  devise_for :web_admins
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
