Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root '/search/', to: 'search#new'

  get '/search/', to: 'search#index', as: 'results'

  get '/searches/:id', to: 'searches#show', as: 'recipe'
end
