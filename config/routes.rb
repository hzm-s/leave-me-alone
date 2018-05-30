Rails.application.routes.draw do
  resource :todo_list, only: [:show, :update]

  resource :google_sign_up, only: [:create]
  resource :session, only: [:new, :destroy]
  resource :google_session, only: [:create]

  resource :marketing, only: [:show]

  root to: 'homes#index'
end
