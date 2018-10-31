Rails.application.routes.draw do
  root "recipes#search"

  post "recipes", to: "recipes#display", as: "recipes"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
