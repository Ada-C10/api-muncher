Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recipes#new'

  resources :recipes, only: [:show]

  post 'recipes', to: 'recipes#index'

  # get ':recipe/new', to: 'recipes#new', as: 'recipe_new'

  # post ':recipes', to: 'recipes#create', as: 'recipe_create'

end
