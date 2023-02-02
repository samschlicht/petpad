Rails.application.routes.draw do
  devise_for :users
  root to: "pads#index"
  get "/about", to: "pages#about"
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
