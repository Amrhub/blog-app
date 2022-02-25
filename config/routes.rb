Rails.application.routes.draw do
  get 'like/create'
  get 'comment/create'
  get 'comment/new'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:create, :new]
      resources :likes, only: [:create]
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "users#index"

  # Defines the root path route ("/")

  # root "articles#index"

end
