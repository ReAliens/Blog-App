Rails.application.routes.draw do
  resources :posts
  root "user#index"
  resources :users, only: [:index, :display] do
    resources :posts, only: [:index, :display]
  end
end
