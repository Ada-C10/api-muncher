Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recipes#new'

  resources :recipes, only: [:show, :index]

  post 'recipes', to: 'recipes#index'

  get 'recipes', to: 'recipes#index'


end
