Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/about", to: "pages#about"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :pads do
    resources :bookings, only: [:new, :create]
    # Defines the root path route ("/")
    # root "articles#index"
  end
  resources :bookings, only: [:destroy, :index, :show, :edit]
  resources :pets
end
