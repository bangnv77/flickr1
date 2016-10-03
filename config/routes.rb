Rails.application.routes.draw do
  devise_for :users do
    resources :images
  end
  
  root 'images#index'

  resources :images
end
