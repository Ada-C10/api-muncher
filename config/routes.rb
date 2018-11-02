Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recipe#home'

  post '/recipes', to: 'recipe#index', as: 'recipes'
  get '/recipe/:uri', to: 'recipe#show', as: 'recipe'
  # get ':recipe/new', to: 'recipe#new', as: 'recipe_new_'
  # post ':recipe', to: 'recipe#create', as: 'recipe_create'

end
