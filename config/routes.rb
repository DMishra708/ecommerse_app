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
      get 'cart'
      get 'checkout'
    end
    member do
      get 'checkout'
    end
  end
end
