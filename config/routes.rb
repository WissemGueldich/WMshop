Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
  root to: "home#index"
=======
  root to: "products/index"
  resources only: [:index]
>>>>>>> 679d82087240f6a14837f499f225fe59e6bd91db
end
