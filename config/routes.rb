 PayUp::Application.routes.draw do


  resources :users
  resources :bets
  resource :session, only: [:new, :create, :destroy]


  root 'sessions#new'
  
end
