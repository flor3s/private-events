Rails.application.routes.draw do
	root to: 'events#index'
  get '/signup',			to: 'users#new'
  post '/signup',			to: 'users#create'
  get '/login',		 		to: 'sessions#new'
  post '/login', 			to: 'sessions#create'
  delete '/logout',		to: 'sessions#destroy'
  get '/events/new', 	to: 'events#new'
  post '/events/new', to: 'events#create'

  resources :users
  resources :events
end
