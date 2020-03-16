Rails.application.routes.draw do
  root to: 'items#index'

  resources :credit
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
