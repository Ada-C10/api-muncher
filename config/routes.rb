Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'recipes#search'
  post 'results', to: 'recipes#results', as: 'recipe_results'
  get ':recipe', to: 'recipes#show', as: 'recipe'
end
