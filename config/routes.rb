Rails.application.routes.draw do
  resources :users
  resources :sessions
  get '/sessions/new', to: 'sessions#new', as: 'new_login'
  post '/login', to: 'sessions#login', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  get '/home', to: 'users#home', as: 'home'
  root to: "users#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
