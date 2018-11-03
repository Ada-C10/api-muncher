Rails.application.routes.draw do
  root 'recipe#homepage'
  get ':recipe/search', to: 'recipe#search', as: 'recipe_search'

end
