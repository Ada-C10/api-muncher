Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homepage#index'
  post '/findfood', to: 'recipes#find', as: 'find'
end
