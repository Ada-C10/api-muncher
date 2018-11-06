Rails.application.routes.draw do
  root "recipes#new"

  get '/recipes/index', to: "recipes#index", as: "recipes"
  get '/recipes/new', to: "recipes#new"
  get '/recipes/:id', to: "recipes#show", as: "show"
end
