Rails.application.routes.draw do
  namespace :api do
    get "/users" => "users#index"
    post "/users" => "users#create"
    get "/users/:id" => "users#show"
    patch "/users/:id" => "users#update"
    delete "/users/:id" => "users#destroy"


    post "/sessions" => "sessions#create"

    get "/lists" => "lists#index"
    post "/lists" => "lists#create"
    get "/lists/:id" => "lists#show"
    patch "/lists/:id" => "lists#update"
    delete "/lists/:id" => "lists#destroy" 

    get "/invitations" => "invitations#index"
    post "/invitations" => "invitations#create"
    get "/invitations/:id" => "invitations#show"
    patch "/invitations/:id" => "invitations#update"
    delete "/invitations/:id" => "invitations#destroy"

    get "/tasks" => "tasks#index"
    post "/tasks" => "tasks#create"
    get "/tasks/:id" => "tasks#show"
    patch "/tasks/:id" => "tasks#update"
    delete "/tasks/:id" => "tasks#destroy"

  end
end
