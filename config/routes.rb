Rails.application.routes.draw do

  root 'recipes#new'
  get ':recipe/new', to: 'recipes#new', as: 'recipe_new'
  post ':recipe', to: 'recipes#create', as: 'recipe_create'
  get ':recipes/index', to: 'recipes#index', as: 'recipes'
  get ':recipe/show', to: 'recipes#show', as: 'recipe_show'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
