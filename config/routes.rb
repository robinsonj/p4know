P4know::Application.routes.draw do
  root to: 'home#index'

  post 'sessions/create'

  resources :things, only: [] do
    get :autocomplete_thing_name, on: :collection, as: :autocomplete_names
  end
end
