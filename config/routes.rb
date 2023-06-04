Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: "users#show"
  resources :orders, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :order_items, only: [:new, :create]
end
