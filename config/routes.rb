Rails.application.routes.draw do
  root to: 'items#index'

  resources :items do
    collection do
      get :hoge
    end
    collection do
      get :hige
    end
    collection do
      get :huge
    end
  end
  resources :users
end
