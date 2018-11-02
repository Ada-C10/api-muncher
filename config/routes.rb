Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root
  get '/search/', to: 'search#index', as: 'homepage'
  get '/searches/:id', to: 'searches#show', as: 'search'
end
