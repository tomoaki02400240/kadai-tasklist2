Rails.application.routes.draw do
  get 'users/new'

  get 'users/create'

  get 'toppages/index'

 root to: 'toppages#index'
 resources :tasks
 
 get 'signup', to: 'users#new'
 post 'signup', to: 'users#create'
 
 get 'login', to: 'sessions#new'
 post 'login', to: 'sessions#create'
 delete 'logout', to: 'sessions#destroy'
end
