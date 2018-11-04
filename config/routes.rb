Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'search#index'

  # get 'recipe/show/:id', to: 'recipes#show', as: 'return_recipe'
  
  resources :recipes, only: [:index, :show]

end
