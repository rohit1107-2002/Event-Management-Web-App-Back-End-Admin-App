Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # get '/index' ,to: "root#index"
  get '/about' ,to: "root#about"
  get '/contact' ,to: "root#contact"
  # get 'response' ,to: "root#api"
  #get 'user/:id/:name' ,to: "root#user"
  post '/add' ,to: "root#add"
  get '/delete/:id' ,to: "root#delete"
  get '/search' ,to: "root#search"
  get '/update/:id' ,to: "root#update"
  post '/updateform' ,to: "root#updateform"
  get '/add_event' ,to: "root#add_event"
  root "root#index"
end
