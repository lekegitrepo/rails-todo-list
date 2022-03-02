Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  get 'log_in', to: 'sessions#new'
  get 'log_out', to: 'sessions#destroy'

  resources :sessions, only: [:new, :create, :destroy]

  resources :users
  get 'sign_up', to: 'users#new'

  resources :tasks

  get 'tasks/:id/complete/:completed', to: 'tasks#complete'
end
