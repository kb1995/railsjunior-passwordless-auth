Rails.application.routes.draw do
  get 'sessions/create'
  get 'sessions/destroy'

  get 'logins/new'
  post 'logins/create'
  
  get 'users/index'
  get 'users/edit'
  get 'users/update'
  
  # include in article
  root 'users#index'
end
