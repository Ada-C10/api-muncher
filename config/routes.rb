Rails.application.routes.draw do
  root 'recipes#home'
  resources :recipes, only: [:index, :show]

  # get '/recipes'
  get '/recipes', to: 'recipes#index', as: 'search'

end
