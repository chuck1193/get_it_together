Rails.application.routes.draw do
  namespace :api do
    post "/users" => "users#create"

    post "/sessions" => "sessions#create"

    get '/lists' => 'lists#index'
    post '/lists' => 'lists#create'
    get '/lists/:id' => 'lists#show'
    patch '/lists/:id' => 'lists#update'
    delete '/lists/:id' => 'lists#destroy'

    get '/tasks' => 'tasks#index'
    post '/tasks' => 'tasks#create'
    get '/tasks/:id' => 'tasks#show'
    patch '/tasks/:id' => 'tasks#update'
    delete '/tasks/:id' => 'tasks#destroy'
  end
end
