Rails.application.routes.draw do
  devise_for :users
  root to: "users#show"
  resources :orders, only: [:new, :create]
  resources :order_items, only: [:new, :create]
end
