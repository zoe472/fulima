Rails.application.routes.draw do
  root to: 'items#index'

  resources :credit
  resources :items
  resources :mypage do
    collection do
      get 'sell'
      get 'purchace'
      get 'profile'
      get 'logout'
      get 'mail'
    end
  end
end
