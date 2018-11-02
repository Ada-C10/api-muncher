Rails.application.routes.draw do
  get "recipes/index", to: "recipes#index", as: "recipes_index"
  get 'recipes/show/:uri', to: "recipes#show", as: "recipe_show"

    # root 'sessions#root'
    # get "/auth/github/callback", to: "sessions#create", as: 'auth_callback'
    #
    # get '/search', to: 'searches#new', as: 'new_search' #where searches are routed to
    # post ':channel', to: 'search#create', as: 'create_search'
end
