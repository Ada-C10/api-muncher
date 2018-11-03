Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'search#index'

  resources 'recipes'

  # get 'recipes#index', to: 'recipes#index', as: 'recipes'

end
