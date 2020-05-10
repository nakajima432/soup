Rails.application.routes.draw do
  devise_for :users
  root to: "cafeterias#index"
  # resources :users
end