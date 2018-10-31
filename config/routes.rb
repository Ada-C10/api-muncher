Rails.application.routes.draw do

  root 'recipes#new'
  get 'recipes/index', to: "recipes#index", as: "recipes"
  get 'recipe/:id', to: "recipes#show"
  get 'recipe/new', to: "recipe#new"
  post 'recipe', to: "recipes#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
