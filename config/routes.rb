Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  #root "users#index"
  #get '/users', to: "users#index"

  resources :authors
  resources :books

  resources :students
  resources :faculties

  resources :employees
  get '/results', to: "employees#results", as: :results
  get 'increase_order', to:'employees#increase_order', as: :increase_order
  get 'decrease_order', to:'employees#decrease_order', as: :decrease_order
  get 'employee', to:'employees#employee_querys', as: :employee_querys

  get '/all_product', to: "product1s#all_product", as: :all_product
  get 'display_all_products', to:'product1s#display_all_products', as: :display_all_products
  get 'display_active_products', to:'product1s#display_active_products', as: :display_active_products

  resources :product1s
  resources :customers
  resources :orders

  #active record association
  get "ussers/enroll"
  get "ussers/unenroll"

  resources :events
  get 'signup', to: 'ussers#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :ussers, except: [:new]
  resources :categories

  get 'comments/like', to: 'comments#like'
  resources :comments

  
  root "pages#home_page"
  get '/pages', to: "pages#home_page"


  #rails routing
  #add nested routes
  resources :anproducts do
    resources :anorders
  end
  
  #use namespace
  namespace :business do
    get '/ancustomers/:id/preview', to: "ancustomers#preview"
    get '/ancustomers/search', to: "ancustomers#search"
    delete '/ancustomers/:id/preview', to: "ancustomers#delete_customer"
    resources :ancustomers, only: [:create, :index, :edit, :update, :new]
  end

  #root to: "anproducts#index"

  #layouts and rendering
  devise_for :nusers
  resources :nproducts
  resources :norders

  #root "nusers#homepage"
  get 'homepage', to: "nusers#homepage"

  #routes for action view form helpers
  resources :nemployees
  get 'search', to: "nemployees#search"

  #routes for rails api
  namespace :api do
    namespace :v1 do
      get 'article_search', to: "articles#article_search"
      get 'arcomment_search', to: "arcomments#arcomment_search"
      resources :articles do
        resources :arcomments
      end
    end
  end
  #routes for action mailer basics
  resources :newusers
end
