Rails.application.routes.draw do
  root "pages#home"

  resources :recipes, only: [:index, :show]

  get '/search', to: 'recipes#index', as: "search"
end
