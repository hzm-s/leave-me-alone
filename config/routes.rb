Rails.application.routes.draw do
  resource :todo_list, only: [:show]

  resources :todos, only: [:create]
  patch 'todo_list/:todo_list_id/:todo_list_index' => 'todos#update', as: :todo

  resources :pages, only: [:index, :show]
  root to: 'pages#index'
end
