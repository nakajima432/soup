Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"
  resources :top, only: :index
  namespace :cafeterias do
    resources :searches, only: :index
  end
  resources :cafeterias do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update] 
end