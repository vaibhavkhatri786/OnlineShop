Rails.application.routes.draw do
  devise_for :users
  
  resources :categories
  resources :products
  resources :buyers, only: [:index, :show]
  resources :order_items
  resources :cart_items
  resource :carts, only: [:show]
  root "buyers#index"
end
