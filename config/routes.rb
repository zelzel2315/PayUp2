 PayUp::Application.routes.draw do


  resources :users, defaults: { format: :json }
  resources :bets, defaults: { format: :json }
  

  get '/venmo/home' => 'venmo#home', as: :home
  post '/venmo/home' => 'venmo#bet'


  root 'users#index'
  
end
