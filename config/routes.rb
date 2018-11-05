Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'recipes#home'
  get 'recipes/label', to: 'recipes#show', as: 'recipe'
  get 'recipes', to: 'recipes#index', as: 'recipe_list'
end
