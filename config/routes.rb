Rails.application.routes.draw do
  root 'users#welcome'
  get '/signin' => 'users#signin', as: :signin
  post '/login' => 'users#login', as: :login
  get '/logout' => 'users#logout', as: :logout
  resources :users, only: [:new, :show, :create, :edit, :update]
  resources :attractions
  post '/attractions/ride' => 'attractions#ride'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
