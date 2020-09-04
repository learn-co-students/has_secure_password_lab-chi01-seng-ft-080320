Rails.application.routes.draw do

  root 'welcome#index', as: 'home'

  get '/sessions/new', to: 'sessions#new', as: 'new_login'
  post '/login', to: 'sessions#create', as: 'login'
  post '/logout', to: 'sessions#destroy'
  
  resources :users, only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

