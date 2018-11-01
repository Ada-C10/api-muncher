Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'recipes#home'

  # :search_terms could get saved in params. If you go to get /something/recipes =
  # If using a path helper, need to pass the search terms
  # get ':search_terms/recipes', to: 'recipes#list_recipes'

  get 'recipes/index', to: 'recipes#index', as: 'recipe_index'
  # What is show route? # Run search for URI of recipe?
  # get 'recipes/:uri', to: 'recipes#show', as: 'recipe'
  get 'recipes/:id', to: 'recipes#show', as: 'recipe'
end
