Rails.application.routes.draw do
  root 'home#index'


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
end
