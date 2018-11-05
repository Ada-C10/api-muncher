Rails.application.routes.draw do

  root 'recipes#search'
  get 'index', to: 'recipes#index', as: 'recipes_index'
  get ':recipe/show', to: 'recipes#show', as: 'recipes_show'

end
