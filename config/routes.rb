Rails.application.routes.draw do
  resources :funcionarios
  root to: 'welcome#index'
  resources :clientes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
