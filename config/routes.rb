Rails.application.routes.draw do
  devise_for :users
  root to: "users#show"
  resources :orders, only: [:new, :create, :index, :show, :edit, :destroy]
  resources :order_items, only: [:new, :create]
end
