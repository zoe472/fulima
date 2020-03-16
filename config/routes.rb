Rails.application.routes.draw do
  get 'credit/new'
  get 'credit/show'
  root to: 'items#index'

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
