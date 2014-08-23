SwsRailsApp::Application.routes.draw do
  resources :accounts

  get "home/index"
  root 'home#index'
end
