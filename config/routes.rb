Rails.application.routes.draw do
  devise_for :users

  root 'images#index'

  resources :users, :only => [:show]

  resources :images
end
