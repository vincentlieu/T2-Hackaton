Rails.application.routes.draw do
  get "/", to: "pages#home", as: "root"
  
  #Room routes
  resources :rooms
end
