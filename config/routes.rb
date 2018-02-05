Rails.application.routes.draw do
	root to: 'static_pages#home'
  get '/signup',			to: 'users#new'
  post '/signup',			to: 'users#create'
  get '/login',		 		to: 'sessions#new'
  post '/login', 			to: 'sessions#create'
  delete '/logout',		to: 'sessions#destroy'
  get '/events/new', 	to: 'events#new'
  post '/events/new', to: 'events#create'
  get '/invite',      to: 'invitations#new'
  post '/invite',     to: 'invitations#create'
  get 'attend',       to: 'attendances#new'
  post 'attend',      to: 'attendances#create'

  resources :users
  resources :events
end