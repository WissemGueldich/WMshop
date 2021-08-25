Rails.application.routes.draw do
  resources :messages
  resources :rooms
  devise_for :users
  root to: 'categories#index'

  resources :categories, only: [:index] do
    resources :products, only: [:index]
  end

    get '/cart', to: 'order_items#index'
    resources :order_items, path: '/cart/items'
    get 'rooms/:id',to: 'application#show'
    #mount ActionCable.server => '/cable'
end
