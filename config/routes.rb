Rails.application.routes.draw do
  devise_for :users
  resources :bookings
  resources :rooms
  get 'dashboard/index'
  get 'search', to:'rooms#search'
  root 'pages#home'
end
