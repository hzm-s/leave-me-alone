Rails.application.routes.draw do
  resource :todo_list, only: [:show, :update]
  resource :marketing, only: [:show]
  resource :session, only: [:new, :create]
  root to: 'todo_lists#show'
end
