Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'jobs#index'
  resource :jobs
  resource :users, only: [:new, :create, :index]
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post 'logout' => 'sessions#destroy'
end
