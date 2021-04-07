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
      get 'remove_item_from_cart'
    end
    member do
      post 'place_order'
    end
  end
  resources :orders do
    collection do
      post 'confirm'
      post 'payment'
    end  
  end
end
