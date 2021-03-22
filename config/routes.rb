Rails.application.routes.draw do
  root 'home#index'
  resources :admin, only: [:index]
  namespace :admin do
    resources :products
  end
  resources :categories 
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
