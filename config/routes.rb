Rails.application.routes.draw do
  resource :todo_list, only: [:show, :update]

  resources :pages, only: [:index, :show]

  root to: 'todo_lists#show'
end
