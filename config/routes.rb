Rails.application.routes.draw do

  root 'recipes#search'

  get 'recipes/search', to: "recipes#search", as: "search"
  get '/recipes', to: "recipes#index", as: "recipes"
  get '/recipe/:id', to: "recipes#show", as: "show"




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
