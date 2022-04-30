Rails.application.routes.draw do
  root 'home#index'
  get '/tuto08/home', to: 'home#index'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

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

  # For tuto 11
  get '/tuto11/qrcode', to: 'qrcode#index'
  resources :qrcode
  post '/create_qrcode', to: 'qrcode#create_qrcode'
  post '/download', to: 'qrcode#download'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
