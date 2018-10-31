# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  root 'recipe_search#search'
  get 'recipe_search/index', to: 'recipe_search#index', as: 'recipe_searches'
  get 'recipe_search/show', to: 'recipe_search#show', as: 'recipe_search'
end
