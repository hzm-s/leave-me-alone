Rails.application.routes.draw do
  resource :todo_list, only: [:show, :update]
  resource :marketing, only: [:show]
  resource :session, only: [:new, :create]

  scope 'sign_up', as: :sign_up, module: :sign_up do
    resource :google, only: [:create]
  end

  root to: 'todo_lists#show'
end
