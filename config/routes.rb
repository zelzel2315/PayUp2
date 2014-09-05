 PayUp::Application.routes.draw do


  resources :users
  resources :bets
<<<<<<< HEAD
  get '/settle/bet' => 'bets#settle'
=======
  resource :session, only: [:new, :create, :destroy]
>>>>>>> 19a7e7bb2fdb977a8f5633c1a7be66eaebdad134


  root 'sessions#new'
  
end
