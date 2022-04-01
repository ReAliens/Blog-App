Rails.application.routes.draw do
  resources :posts
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments
      resources :likes
    end
  end
end
