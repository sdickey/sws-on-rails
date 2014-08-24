SwsRailsApp::Application.routes.draw do
  get "log_in" => "sessions#new", :as => "login"
  get "log_out" => "sessions#destroy", :as => "logout"
  resources :sessions
  resources :accounts

  get "home/index"
  root 'home#index'
end
