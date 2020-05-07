Rails.application.routes.draw do
  get "/", to: "rooms#index", as: "root"
  devise_for :users
  #Room routes
  resources :rooms
  resources :room_messages
end
