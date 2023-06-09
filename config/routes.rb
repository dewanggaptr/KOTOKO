Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    resources :transactions
    resources :product_transacs
    resources :cashiers
    post "/login", to: "cashiers#login"
    resources :category
    resources :products
    # get "/search", to: "products#search"
  end
end
