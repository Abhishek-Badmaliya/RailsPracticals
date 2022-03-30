Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  get '/users', to: "users#index"

  resources :authors
  resources :books

  resources :students
  resources :faculties

  resources :employees
  get '/results', to: "employees#results", as: :results
  get 'increase_order', to:'employees#increase_order', as: :increase_order
  get 'decrease_order', to:'employees#decrease_order', as: :decrease_order
  get 'employee', to:'employees#employee_querys', as: :employee_querys

end
