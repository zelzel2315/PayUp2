 PayUp::Application.routes.draw do


  resources :users
  resources :bets
  resource :userbet

<<<<<<< HEAD
  get '/users/bet' => 'venmo#home', as: :home
  post '/users/bet' => 'users#bet'
  

  
=======
  get '/settle/bet' => 'bets#settle'
>>>>>>> 621f83c2b1c13f326b9a39dcd2f413e9da282a43

  resource :session, only: [:new, :create, :destroy]



  root 'sessions#new'
  
end
