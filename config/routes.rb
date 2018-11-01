Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recipes#index'
  get ':recipe/new', to: 'recipe#new', as: 'recipe_new'
  post ':recipe', to: 'recipe#create', as: 'recipe_create'

end
