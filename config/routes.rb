Rails.application.routes.draw do
  root to: "tasks#index"
  devise_for :users
  resources :tasks
  # get    'tasks'     => 'tasks#index'
  # post   'tasks'     => 'tasks#store'
  # get    'tasks/:id' => 'tasks#show'
  # put    'tasks/:id' => 'tasks#update'
  # delete 'tasks/:id' => 'tasks#destroy'
end
