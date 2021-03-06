Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "users#index"

  # Defines the root path route ("/")

  # root "articles#index"

end
