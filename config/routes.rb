Rails.application.routes.draw do
  get 'recipes/index'
  get 'recipes/show'
  get 'recipes/list', to: "recipes#list", as: "list_recipes"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
