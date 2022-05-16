Rails.application.routes.draw do
  devise_for :users
  resources :bookings
  resources :rooms
  get 'dashboard/index'
  get 'search', to:'rooms#search'
  root 'pages#home'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
