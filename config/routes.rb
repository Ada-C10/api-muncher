Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'recipes#home'

  get '/recipes', to: 'recipes#index', as: 'recipes'
  get '/recipe/:uri', to: 'recipes#show', as: 'recipe'

  match "*path", to: "recipes#catch_404", via: :all
end
