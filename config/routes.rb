Rails.application.routes.draw do
  root "users#index"
  get 'users/index'
  get 'users/create'
  get 'users/:id' => 'users#show'
  get '/ideas/users/:id' => 'users#show'
  post 'likes/create'
  get '/ideas' => 'ideas#index'
  get 'ideas/index' => 'ideas#index'
  post 'ideas/create'
  get 'ideas/:id' => 'ideas#show'
  get 'ideas/:id/destroy' => 'ideas#destroy'
  post 'sessions/create'
  get '/signout' => 'sessions#destroy'
  resources :users

end
