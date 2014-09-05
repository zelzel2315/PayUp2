 PayUp::Application.routes.draw do


  resources :users
  resources :bets

  get '/venmo/home' => 'venmo#home', as: :home
  post '/venmo/home' => 'venmo#bet'
  get 'venmos' => 'venmo#index'


  root 'users#index'
  
end
