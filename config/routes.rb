# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  root 'recipe_searches#home'

  get "/auth/:provider/callback", to: "sessions#create", as: 'auth_callback'
  delete "/logout", to: "sessions#destroy", as: "logout"

  resources :recipe_searches, only: [:index, :show]
  resources :favorites, only: [:index, :create, :destroy]
  delete "/favorites", to: "favorites#clear", as: "clear_favorites"
end
