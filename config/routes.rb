Rails.application.routes.draw do


  get 'classes/select'
  post '/enroll', to: 'classes#enroll'
  get '/update_numbers', to: 'classes#update_numbers'

  resources :profiles
  root 'sessions#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get 	'/admin/:id', to: 'admin#show'

  resources :users
  resources :profiles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
