SwsRailsApp::Application.routes.draw do
  resources :sessions
  resources :accounts
  resources :account_dashboard

  get "signup" => "account#new", :as => "signup"
  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"
  get "home/index"
  root 'home#index'
end
