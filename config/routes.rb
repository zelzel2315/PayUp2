 PayUp::Application.routes.draw do


  resources :users, defaults: { format: :json }
  resources :bets, defaults: { format: :json }
  
  
  get '/venmo/home' => 'venmo#home', as: :home
  post '/venmo/home' => 'venmo#bet'
  get 'venmos' => 'venmo#index'


  root 'users#index'
  
end
