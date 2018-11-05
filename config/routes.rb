Rails.application.routes.draw do
  root "recipes#index"
  get 'recipes/index', to: "recipes#index", as: "list_recipes"
  get 'recipes/show/:find', to: "recipes#show", as: "show_recipe"
  # get 'recipes/list', to: "recipes#list", as: "list_recipes"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
