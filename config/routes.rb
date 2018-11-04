Rails.application.routes.draw do
  get 'sessions/create'
  get 'sessions/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  post 'search', to: 'pages#search', as: 'search'
  get 'search/:queery', to: 'pages#search'
  get 'recipe/:title', to: 'pages#recipe'
  get 'search', to: 'pages#search', as: 'search_get'
  get 'recipe', to: 'pages#recipe', as: 'recipe'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions, only: [:create, :destroy]
end
