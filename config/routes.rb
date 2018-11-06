Rails.application.routes.draw do

  root 'recipes#search'

  get 'recipes', to: 'recipes#index', as: 'recipes_index'

  get 'recipe/:recipe', to: 'recipes#show', as: 'recipe_show'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
