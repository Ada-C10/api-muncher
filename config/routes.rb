Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homepage#index'
  get "/homepage", to: "homepage#index", as: "home"
  get "/search", to: "recipes#index", as: "search"
  get "/recipe", to: "recipes#show", as: "recipe"

end
