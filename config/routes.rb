Rails.application.routes.draw do
  root 'recepies#home'
  get 'recepies/index', to: 'recepies#index', as: 'recepies_index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
