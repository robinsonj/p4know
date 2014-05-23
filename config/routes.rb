P4know::Application.routes.draw do
  root to: 'home#index'

  resources :things, only: [] do
    get :autocomplete_thing_name, on: :collection, as: :autocomplete_names
  end
end
