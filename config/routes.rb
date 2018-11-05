Rails.application.routes.draw do
  root 'main#index'
  resources :recipes, only: [:index]
  resource :recipe, only: [:show]
end
