# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  get 'sessions/create'
  get 'sessions/destroy'
  root 'recipe_searches#home'
  resources :queries, only: [:create, :destroy]
  resources :recipe_searches, only: [:index, :show]
end
