Rails.application.routes.draw do
  resources :posts
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
  get "/posts/new", to: "posts#new"
  post "/posts/create", to: "posts#create"
  post "/users/:user_id/posts/:id/like", to: "likes#create"
  post "/users/:user_id/posts/:id/create_comment", to: "comments#create"
end
