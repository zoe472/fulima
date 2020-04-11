Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root to: 'items#index'

  resources :items do
    collection do
      get :hoge
      get :hige
    end
  end
  resources :users

  # resources :shared do
  #   member do
  #     get :_test
  #     delete '_test/:id' => '_test#destroy'
  #     get :_test2
  #   end
  # end

  resources :credit
  resources :mypage do
    member do
      get :sample
      get :sample2
    end
    collection do
      get :sell
      get :purchace
      get :profile
      get :logout
      get :mail
    end
  end
end
