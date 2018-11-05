Rails.application.routes.draw do
  root 'recipes#homepage'
  # get 'recipe/homepage', to: 'recipe#search', as: 'recipe_search'
  # get 'index', to: 'recipes#index', as: 'recipe_index'
  # get 'show', to: 'recipes#show', as: 'recipe'
    get 'recipes', to: 'recipes#index', as: 'recipes'
    # get '/recipes/:uri', to: 'recipes#show', as: 'recipe'
      get '/recipe/:id', to: "recipes#show", as: "show"


end
# # root 'recipes#home'
# Rails.application.routes.draw do
#    root 'recipes#search'
#    get 'recipes/search', to: "recipes#search", as: "search"
#   get '/recipes', to: "recipes#index", as: "recipes"
#   get '/recipe/:id', to: "recipes#show", as: "show"
#    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# end
