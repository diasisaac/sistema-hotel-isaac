Rails.application.routes.draw do
  resources :bookings
  resources :rooms
  get 'dashboard/index'
  devise_for :users
  root 'pages#home'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
