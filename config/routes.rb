P4know::Application.routes.draw do
  root to: 'home#index'

  post 'sessions/create'
  post 'sessions/destroy'

  post 'set_knowledge', to: 'things#set_knowledge'
  post 'get_knowledge', to: 'things#get_knowledge'

  resources :things, only: [] do
    get :autocomplete_thing_name, on: :collection, as: :autocomplete_names
  end
end
