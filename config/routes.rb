Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: "users#show"
  resources :orders do
    resources :comments, only: :create
  end
  resources :order_items, only: [:new, :create]
end
