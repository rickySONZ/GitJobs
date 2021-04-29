Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'users#home'
  resources :users, only: [:new, :create, :index]
  
  resources :jobs, only: [:new, :create, :index, :show, :edit, :update] do
    resources :reviews
  end

  resources :user_jobs

  resources :reviews

  get '/home' => 'users#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/auth/:provider/callback', to: 'sessions#omniauth'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
