Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recipes#search'
  get 'index', to: 'recipes#index', as: 'recipes_index'
  get ':id/show', to: 'recipes#show', as: 'recipes_show'
end
