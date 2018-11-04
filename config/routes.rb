Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'main#index'
  # get ':recipe/new', to: 'recipe#new', as: 'recipe_new'
  # # get ':recipe', to: 'recipe#show', as: 'recipe_show'

  resources :recipes do
    end
    
end
