Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :posts do
    resources :comments
  end
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "my_post", to: "posts#my_post"
  post "follow", to: "users#follow"
  post "unfollow", to: "users#unfollow"
  get "home_page", to: "home#index"
  get "categories", to: "categories#index"
  post "categories", to: "categories#new"
  get "search", to: "home#search"
end
