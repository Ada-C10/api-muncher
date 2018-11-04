Rails.application.routes.draw do
  root 'recipes#main'

  get 'recipes', to: 'recipes#index', as: 'recipes'

  get 'recipe/:id', to: 'recipe#show', as: 'recipe'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
