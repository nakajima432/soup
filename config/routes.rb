Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"
  resources :top, only: :index
  resources :cafeterias do
    resources :comments, only: :create
  end
  resources :users, only: [:show, :edit, :update] 
end