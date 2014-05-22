P4know::Application.routes.draw do
  root to: 'home#index'

  resources :things, only: [] do
    get :autocomplete_name, on: :collection
  end
end
