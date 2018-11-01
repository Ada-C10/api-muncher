Rails.application.routes.draw do
  root 'recipes#home'
  # resources :recipes, only: [:index, :show]

  # get '/recipes'
  get '/recipes', to: 'recipes#index', as: 'search'

  get '/recipes/:uri', to: 'recipes#show', as: 'recipe'

end
