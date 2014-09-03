PayUp::Application.routes.draw do


  resources :users
  resources :bets
  
  get '/venmo/home' => 'venmo#home', as: :home
  post '/venmo/home' => 'venmo#bet'

  root 'users#index'
  
end
