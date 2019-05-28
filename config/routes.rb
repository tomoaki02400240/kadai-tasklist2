Rails.application.routes.draw do
 root to: 'tasks#index'
 resources :tasks
 
 get 'signin', to: 'sessions#new'
 post 'signin', to: 'sessions#create'
 delete 'signout', to: 'sessions#destroy'
end
