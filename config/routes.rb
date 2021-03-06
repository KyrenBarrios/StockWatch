   Rails.application.routes.draw do
      root "sessions#home"
     
     
    
     
     
     
      get '/signup' => 'users#new'
      post '/signup' => 'users#create'
     
      #login route
      get '/login' => 'sessions#new'
      post '/login' => 'sessions#create'
     
      #logout route
      
      get "/logout", to: "sessions#logout", as: "logout"
      
      get "/search" , to: "stocks#search", as: "search"
     
      #omniauth callback route
     
      
      match '/auth/:google_oauth2/callback' => 'sessions#google', via: [:get,:post]
     
      resources :stocks do
         resources :comments
       end
      
       
       resources :comments

       
       resources :users do
         resources :stocks, shallow: true #same thing as saying [:new,:create,index]
       end
     
       resources :categories, only: [:index, :show, :new]
     
     
       delete '/stocks/:id', to: 'stocks#destroy' #destroy
     
     
     
     
       # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
     end
     
     
  
  
    
    
  
  


  


  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
