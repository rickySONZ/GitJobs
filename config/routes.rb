Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'jobs#index'
  resources :users, only: [:new, :create, :index]
  
  resources :jobs, only: [:new, :create, :index, :show]   do
    resources :reviews, only: [:new, :create, :index, :show]
  end


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post 'logout' => 'sessions#destroy'
end
