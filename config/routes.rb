Rails.application.routes.draw do
  
  # root to: "home#index"
  root to: "users#index"
  resources :posts do
    resources :comments
  end
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get 'home/page'
  get "sign_up", to: "users#new"
  post "sign_up", to: "users#create"
  get "sign_in", to: "users#index"
  post "sign_in", to: "users#sign_in"
  get "sign_out", to: "users#sign_out"
  get "my_page", to: "home#my_page"
  post "follow", to: "users#follow"
  post "unfollow", to: "users#unfollow"
  get "home_page", to: "home#index"
  # post "comment", 
  
end
