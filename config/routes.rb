Rails.application.routes.draw do

  devise_for :web_admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "web_admin/sessions"
  }
  namespace :web_admin do
    get 'homes/top'
    resources :genres, only:[:index, :create, :edit, :update]
    resources :contributors, only:[:index, :show, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :items, only:[:index, :show, :edit, :update]
  end

  devise_for :contributor, skip: [:passwords], controllers: {
  registrations: "post_admin/registrations",
  sessions: 'post_admin/sessions'
  }
  namespace :post_admin do
    get 'homes/top'
    resources :contributors, only:[:show, :edit, :update]
    resources :items, only:[:index, :new, :create, :show, :edit, :update, :destroy]
  end

  devise_for :customer, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  scope module: :public do
    root  'homes#top'
    get 'homes/top'
    resources :customers, only:[:show, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
