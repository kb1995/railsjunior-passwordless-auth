Rails.application.routes.draw do
  #
  get 'sessions/create'
  delete 'sessions/destroy'

  #
  get 'logins/new'
  post 'logins/create'
  
  #
  resources :users
  
  #
  root 'users#index'
end
