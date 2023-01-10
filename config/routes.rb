Rails.application.routes.draw do

  devise_for :web_admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "web_admin/sessions"
  }
  namespace :web_admin do
    get 'homes/top'
    resources :genres
    resources :contributors
    resources :customers
    resources :items
  end

  devise_for :contributor, skip: [:passwords], controllers: {
  registrations: "post_admin/registrations",
  sessions: 'post_admin/sessions'
  }
  namespace :post_admin do
    get 'homes/top'
    resources :contributors do
      resource :relationships, only: [:create, :destroy]
      #フォローしてくれている人全員を表示してくれる
      get :follower, on: :member
    end
    ##退会画面
    get 'contributors/:id/unsubscribe' => 'contributors#unsubscribe', as: 'unsubscribe'
    #論理削除用のルーティング
    patch 'contributors/:id/withdrawal' => 'contributors#withdrawal', as: 'contributors_withdrawal'
    resources :items
  end

  devise_for :customer, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  scope module: :public do
    root  'homes#top'
    get 'homes/top'
    get 'home/about' => 'homes#about', as: 'about'
    resources :contributors do
      resource :relationships, only: [:create, :destroy]
      #ある利用者がフォローしている人全員を表示してくれる
      get :followings, on: :member
      #フォローしてくれている人全員を表示してくれる
      get :followers, on: :member
    end
    resources :customers
      #resource :relationships, only: [:create, :destroy]
      #ある利用者がフォローしている人全員を表示してくれる
      #get :followings, on: :member
      #フォローしてくれている人全員を表示してくれる
      #get :follower, on: :member

    ##退会画面
    get 'customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    #論理削除用のルーティング
    patch 'customers/:id/withdrawal' => 'customers#withdrawal', as: 'customers_withdrawal'
    resources :items
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
