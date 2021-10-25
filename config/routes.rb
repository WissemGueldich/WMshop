Rails.application.routes.draw do
  resources :comments
  resources :ratings
  resources :over_categories
  resources :category_groups
  root to: 'products#index'
  
  devise_for :users
  
  resources :messages
  resources :rooms
  resources :products
  resources :categories
  resources :categories, only: [:index] 
  resources :order_items, path: '/cart/items'


  get '/cart', to: 'order_items#index', as: 'payment_method'
  get 'rooms/:id',to: 'application#show'
  get 'categories/:id/products/new', to: 'products#new', as: 'new_category_product'
  get 'success', to: "checkout#success"
  get 'cancel', to: "checkout#cancel"
  get '/history', to: "transactions#index"
  get '/transactions', to: "transactions#admin_index", as: 'all_transactions'
  get '/transaction/:id/items', to: "transaction_items#index", as: 'transaction_items'
  get '/invoice/:id', to: "transactions#invoice", as: "invoice"
  get '/categories/:id/products', to: "categories#index", as: 'category_products'
  get '/sub_category/new/:id', to: "category_groups#new", as: 'new_sub_category'
  get '/variant/new/:id', to: "categories#new", as: 'new_variant'
  get :search, controller: :products
  post 'checkout/create', to: "checkout#create"
  post 'delivery/create', to: "transactions#create", as: 'on_delivery'
  delete '/cart/clear', to: 'order_items#clear'
  delete '/products/:id', to: 'products#destroy', as: 'delete_product'
  delete '/categories/:id', to: 'categories#destroy', as: 'delete_category'

end
