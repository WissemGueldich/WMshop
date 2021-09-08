Rails.application.routes.draw do
  root to: 'categories#index'
  
  devise_for :users
  
  
  resources :messages
  resources :rooms
  resources :products 

  resources :categories, only: [:index] do
    resources :products, only: [:index]
  end
  resources :order_items, path: '/cart/items'


  get '/cart', to: 'order_items#index'
  get 'rooms/:id',to: 'application#show'
  get 'categories/products/new', to: 'products#new'
  get 'success', to: "checkout#success"
  get 'cancel', to: "checkout#cancel"
  get '/history', to: "transactions#index"
  get '/transaction/:id/items',to: "transaction_items#index", as: 'transaction_items'
  post 'checkout/create', to: "checkout#create"
  delete '/cart/clear', to: 'order_items#clear'


    #mount ActionCable.server => '/cable'
end
