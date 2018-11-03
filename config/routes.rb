Rails.application.routes.draw do
  root 'recipes#main'
  
  get 'recipes/:id', to: 'recipes#show', as: 'recipe'

  get 'recipes/index', to: 'recipes#index', as: 'recipes'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
