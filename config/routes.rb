Rails.application.routes.draw do
  resources :line_items
  root 'home#index'
  resources :admin, only: [:index]
  namespace :admin do
    resources :products
  end
  resources :categories 
  devise_for :users
  resources :orders do 
    collection do
      post 'add_item_to_cart' 
    end 
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
