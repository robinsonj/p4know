P4know::Application.routes.draw do
  root to: 'home#index'

  post 'set_knowledge', to: 'things#set_knowledge'
  get  'get_knowledge', to: 'things#get_knowledge'

  resources :things, only: [] do
    get :autocomplete_name, on: :collection
  end
end
