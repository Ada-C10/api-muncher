Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'search#index'

get ':hits/new', to: 'search#new', as: 'search_new'

post ':hits', to: 'search#create', as: 'search_create'


end
