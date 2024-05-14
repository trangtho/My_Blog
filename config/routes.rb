require 'sidekiq/web'
Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # devise_for :users do
  #   mount Sidekiq::Web => '/sidekiq'
  # end

  devise_for :users, controllers: {
                       sessions: 'api/v1/users/sessions',
                       registrations: 'api/v1/users/registrations'
                     } do
    mount Sidekiq::Web => '/sidekiq'
  end

  root to: 'home#index'
  resources :posts do
    resources :comments
  end
  resources :users
  resources :categories
  resources :comments

  namespace :api do
    namespace :v1 do
      resources :posts do
        resources :comments
      end
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'my_post', to: 'posts#my_post'
  post 'follow', to: 'users#follow'
  post 'unfollow', to: 'users#unfollow'
  get 'home_page', to: 'home#index'
  get 'search', to: 'home#search'
  get 'my_posts', to: 'api/v1/posts#my_post'
  get 'api/v1/users/current_user', to: 'api/v1/users/current_user#index'
  mount Sidekiq::Web => '/sidekiq'
end
