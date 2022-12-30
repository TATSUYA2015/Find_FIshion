Rails.application.routes.draw do

  devise_for :web_admin, skip: [:registrations, :passwords] , controllers: {
  sessions: "web_admin/sessions"
  }
  namespace :web_admin do
    get 'homes/top'
    resources :genres, only:[:index, :create, :edit, :update]
  end

  devise_for :contributor, skip: [:passwords], controllers: {
  registrations: "contributor/registrations",
  sessions: 'contributor/sessions'
}

##publicのnamespace作成に入ったらしようね！！
  devise_for :customer,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
