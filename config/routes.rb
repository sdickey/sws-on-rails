SwsRailsApp::Application.routes.draw do
  resources :sessions
  resources :account_dashboard

  resources :accounts do
    resources :owners
    resources :pets
    resources :emergency_contacts
    resources :reservations
  end

  get "signup" => "account#new", :as => "signup"
  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"
  get "home/index"
  root 'home#index'
end
