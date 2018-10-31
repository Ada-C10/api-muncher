Rails.application.routes.draw do
  root "recipes#list"
  get 'recipes/index'
  get 'recipes/find', to: "recipes#find", as: "find_recipe"
  get 'recipes/list', to: "recipes#list", as: "list_recipes"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
