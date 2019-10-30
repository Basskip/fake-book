Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :users
  resources :posts, except: [:edit, :update] do
    resources :likes, only: [:create, :destroy, :index]
    resources :comments, only: [:create, :destroy, :index]
  end
  resources :friend_requests, only: [:create, :destroy]
  resources :friendships, only: [:index, :destroy]
end
