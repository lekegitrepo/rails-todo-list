Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  get 'tasks/:id/complete/:completed', to: 'tasks#complete'

  resources :tasks
end
