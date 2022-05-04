Rails.application.routes.draw do

  get 'sec_sessions/auth'
  get 'sec_sessions/create'
  get 'sec_sessions/destroy'
  root 'home#index'

  # For tuto 08
    get '/tuto08/auth', to: 'auth#auth'

  resources :auths
  resources :sec_sessions, only: [:auth, :create, :destroy]
  get '/tuto08/sign_up', to: 'auths#new', as: 'sign_up'
  get '/tuto08/log_in', to: 'sec_sessions#auth', as: 'log_in'
  get '/tuto08/log_out', to: 'sec_sessions#destroy', as: 'log_out'


  # For tuto 09
  get '/tuto09/upload', to: 'upload#index'
  resources :upload
  post "/create_folder", to: 'upload#create_folder'
  get "/create_folder", to: 'upload#show'

  # For tuto 10
  get '/tuto10/import', to: 'import#index'

  resources :import do
    collection {post :import}
  end
  post '/import_file', to: 'import#import_file'
  get '/import_file', to: 'import#import_file'
  
  # For tuto 11
  get '/tuto11/qrcode', to: 'qrcode#index'
  resources :qrcode
  post '/create_qrcode', to: 'qrcode#create_qrcode'
  post '/download', to: 'qrcode#download'
   
   #For tuto 12
  get '/tuto12/home', to: 'home#index'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'users', to: 'users#index'

  get 'password/reset', to: "password_resets#new"
  post 'password/reset', to: "password_resets#create"

  get 'password/reset/edit', to: "password_resets#edit"
  patch 'password/reset/edit', to: "password_resets#update"
end
