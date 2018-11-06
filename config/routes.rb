Rails.application.routes.draw do
  get root "search#new"
  get "recipes/", to: "recipes#index", as: "recipes_index"
  get 'recipes/:uri/view', to: "recipes#show", as: "recipe_show"

    # root 'sessions#root'
    # get "/auth/github/callback", to: "sessions#create", as: 'auth_callback'
    #
    get '/search', to: 'search#new', as: "search_recipes" #where searches are routed to
    get '/search/create', to: 'search#create', as: 'search_create'
    # post ':channel', to: 'search#create', as: 'create_search'
end
