 PayUp::Application.routes.draw do


  resources :users
  resources :bets

  get '/settle/bet' => 'bets#settle'

  resource :session, only: [:new, :create, :destroy]



  root 'sessions#new'
  
end
