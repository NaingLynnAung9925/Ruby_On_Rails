Rails.application.routes.draw do
  root 'home#index'
  get '/tuto08/home', to: 'home#index'
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get '/tuto09/upload', to: 'upload#index'
  resources :upload
  post "/create_folder", to: 'upload#create_folder'
  get "/create_folder", to: 'upload#show'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
