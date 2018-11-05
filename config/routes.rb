Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'searches#root'

  get ':searches/index', to: 'searches#index', as: 'results'

  get 'searches/:id', to: 'searches#show', as: 'recipe'
end
