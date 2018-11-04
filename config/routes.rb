Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'recipes#new'

post '/recipes', to: 'recipes#index', as: 'list_recipes'

get '/recipes/details', to: 'recipes#show', as: 'show_recipe'
end
