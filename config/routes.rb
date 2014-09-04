 PayUp::Application.routes.draw do


  resources :users
  resources :bets, defaults: { format: :json }

  get '/users/bet' => 'venmo#home', as: :home
  post '/users/bet' => 'users#bet'
  

  


  root 'users#index'
  
end
