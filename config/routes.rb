Rails.application.routes.draw do
  #devise_for :usuarios
  #as :usuarios do
  #  get "sign_in", to: "devise/sessions#new"
  #end

  #devise_scope :usuarios do
  #  get "/some/route" => "some_devise_controller"
  #end
  devise_for :usuarios

  resources :reservas
  root to: 'welcome#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
