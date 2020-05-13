Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"
  resources :top, only: :index
  resources :cafeterias
  resources :users
end

  # post "users/:id/update" => "users#update"