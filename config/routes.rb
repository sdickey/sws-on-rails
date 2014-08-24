SwsRailsApp::Application.routes.draw do
  get "sessions/new"
  resources :accounts

  get "home/index"
  root 'home#index'
end
