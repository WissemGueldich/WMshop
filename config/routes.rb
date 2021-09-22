Rails.application.routes.draw do
  resources :category_groups
  root to: 'products#index'
  
  devise_for :users
  
  
  resources :messages
  resources :rooms
  resources :products 
  resources :categories
  resources :categories, only: [:index] 
  resources :order_items, path: '/cart/items'


  get '/cart', to: 'order_items#index'
  get 'rooms/:id',to: 'application#show'
  get 'categories/products/new', to: 'products#new'
  get 'success', to: "checkout#success"
  get 'cancel', to: "checkout#cancel"
  get '/history', to: "transactions#index"
  get '/transaction/:id/items', to: "transaction_items#index", as: 'transaction_items'
  get '/invoice/:id', to: "transactions#invoice", as: "invoice"
  get '/categories/:id/products', to: "categories#index", as: 'category_products'
  get :search, controller: :products
  post 'checkout/create', to: "checkout#create"
  delete '/cart/clear', to: 'order_items#clear'
  delete '/products/:id', to: 'products#destroy', as: 'delete_product'
  delete '/categories/:id', to: 'categories#destroy', as: 'delete_category'


end
