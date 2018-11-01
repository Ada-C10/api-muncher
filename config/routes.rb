Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homepage#index'
  post '/findfood', to: 'recipes#finder', as: 'find'
  get '/recipe/:food', to: 'recipes#index', as: 'recipes'
  get '/recipe/:recipe_url/show', to: 'recipes#show', as: 'recipe'
end
