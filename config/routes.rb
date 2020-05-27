Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'devise/registrations'
  }

  root to: "top#index"
  resources :top, only: :index

  namespace :cafeterias do
    resources :searches, only: :index
  end

  resources :cafeterias do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]

    collection do
      get :popular
    end
  end

  resources :users, only: [:show, :edit, :update] do
    member do
      get :following, :followers
    end
  end
  
  resources :relationships, only: [:create, :destroy]

end