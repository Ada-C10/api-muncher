Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'recipes#new'
post '/', to: 'recipes#new', as: 'new_path'
get '/:dish', to: 'recipes#index', as: 'list_recipes'

end
