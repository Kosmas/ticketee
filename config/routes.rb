Ticketee::Application.routes.draw do
  root to: "projects#index"

  resources :users
  
  resources :projects do
    resources :tickets
  end

  namespace :admin do
    resources :users
  end

  
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
end