Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  resources :sessions, only: [:new, :create, :destroy]

  resources :users
  get 'signup', to: 'users#new'

  resources :tasks

  get 'tasks/:id/complete/:completed', to: 'tasks#complete'
end
