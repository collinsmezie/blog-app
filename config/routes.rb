Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show] do 
    resources :posts, only: [:index, :new, :create, :show] do 
      resources :comments, only: [:index, :new, :create, :show]
      resources :likes, only: [:new, :create]
    end
  end

  # Defines the root path route ("/")
  root to: 'users#index'
end
