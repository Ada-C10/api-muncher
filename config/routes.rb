Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'search#new'

  post '/search', to: 'search#index', as: 'search_create'

  get ':q', to: 'search#index', as: 'search_index'




end
