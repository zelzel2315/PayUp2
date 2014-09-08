 PayUp::Application.routes.draw do


  resources :users
  resources :bets
  resource :userbet

  get '/settle/bet' => 'bets#settle'

  resource :session, only: [:new, :create, :destroy]



  root 'sessions#new'
  
end
