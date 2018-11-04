Rails.application.routes.draw do
  root 'recipe#homepage'
  get 'search', to: 'recipes#search', as: 'recipe_search'
  get 'show', to: 'recipes#show', as: 'recipe'
end
