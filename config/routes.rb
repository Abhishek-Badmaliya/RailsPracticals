Rails.application.routes.draw do
  get 'employees/index'
  get 'employees/create'
  get 'employees/update'
  get 'employees/destroy'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  get '/users', to: "users#index"

  resources :authors
  resources :books

  resources :students
  resources :faculties
end
