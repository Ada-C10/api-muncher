Rails.application.routes.draw do
  root 'recipes#home'
  get 'index', to: 'recipes#index', as: 'recipes_index'
  get ':uri/show', to: 'recipes#show', as: 'recipes_show'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
