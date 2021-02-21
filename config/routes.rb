   Rails.application.routes.draw do
      root "sessions#home"
     
     #users route
     get '/users/most-active' => 'users#most_active'
     
     
     
      get '/signup' => 'users#new'
      post '/signup' => 'users#create'
     
      #login route
      get '/login' => 'sessions#new'
      post '/login' => 'sessions#create'
     
      #logout route
      delete '/logout' => 'sessions#logout'
     
      #omniauth callback route
     
      
      match '/auth/:google_oauth2/callback' => 'sessions#google', via: [:get,:post]
     
      resources :stocks do
         resources :comments
       end
       resources :comments
       resources :users do
         resources :stocks, shallow: true
       end
     
       resources :categories, only: [:index, :show]
     
     
     
     
     
     
     
       # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
     end
     
     
  
  
    
    
  
  


  


  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
