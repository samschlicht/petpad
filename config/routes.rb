Rails.application.routes.draw do
  devise_for :users
  root to: "pads#index"
  get "/about", to: "pages#about"
  get "/pages/user_profile", to: "pages#user_profile"
  get '/home', to: 'pages#home'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :pads do
    resources :bookings, only: [:new, :create]
    # Defines the root path route ("/")
    # root "articles#index"
  end

  resources :bookings, only: [:destroy, :index, :show, :update]
  resources :pets
  namespace :petsitter do
    resources :bookings, only: :index
    resources :bookings, only: [:update]
  end
end
