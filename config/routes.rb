Rails.application.routes.draw do
  root to: 'sessions#new'
  resources :blogs do
    post 'likes', to: 'favorites#create'
    delete '/likes', to: 'favorites#destroy'
    collection do
      post :confirm
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users do
    member do
      get :likes
    end
  end
end
