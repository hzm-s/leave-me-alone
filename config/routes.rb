Rails.application.routes.draw do
  resource :todo_list, only: [:show, :update]
  resource :marketing, only: [:show]
  resource :session, only: [:new]

  resource :google_sign_up, only: [:create]
  resource :google_session, only: [:create]

  root to: 'todo_lists#show'
end
