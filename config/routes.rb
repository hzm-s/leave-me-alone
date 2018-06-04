Rails.application.routes.draw do
  resource :todo_list, only: [:show, :update]
  resource :instant_todo_list, only: [:show, :update]
  resource :setting, only: [:show]

  resource :google_sign_up, only: [:create]
  resource :session, only: [:new, :destroy]
  resource :google_session, only: [:create]

  resource :marketing, only: [:show]

  root to: 'marketings#index'
end
