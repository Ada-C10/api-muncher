Rails.application.routes.draw do
  root "recipes#home"

  post "recipes", to: "recipes#index", as: "recipes"
  get "recipes", to: "recipes#index"
  get "recipes/:recipe", to: 'recipes#show', as: "recipe"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
