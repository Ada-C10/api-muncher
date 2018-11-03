Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#show', page: "search"
  get 'pages/:page', to: 'pages#show', as: 'page'
  get 'recipes', to: 'recipes#index', as: 'recipes'
end
