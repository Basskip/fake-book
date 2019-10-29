Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :users
  resources :likes, only: [:create, :destroy]
  resources :posts, except: [:edit, :update]
  resources :friend_requests, only: [:create, :destroy]
  resources :friendships, only: [:index, :destroy]
end
