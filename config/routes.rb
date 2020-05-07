Rails.application.routes.draw do
  get "/", to: "pages#home", as: "root"
  devise_for :users
  #Room routes
  resources :rooms
end
