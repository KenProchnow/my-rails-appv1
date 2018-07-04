Rails.application.routes.draw do
  devise_for :users

  root 'home#index'
  
  resources :todos
  resources :homes
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'expenses', :to => "expenses#index"
  get 'expenses/index', :to => "expenses#index"
  get 'expenses/show/:id', :to => "expenses#show"
  get 'expenses/new', :to => "expenses#new"
  post 'expenses/create', :to => "expenses#create"
  get 'expenses/edit/:id', :to => "expenses#edit"
  post 'expenses/update/:id', :to => "expenses#update"
  get 'expenses/delete/:id', :to => "expenses#delete"


end
