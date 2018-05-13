Rails.application.routes.draw do
  resource :todo_list, only: [:show]
  resources :todos, only: [:create]

  resources :pages, only: [:index, :show]
  root to: 'pages#index'
end
