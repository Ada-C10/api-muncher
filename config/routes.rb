Rails.application.routes.draw do
  root 'recepes#home'
  get 'index', to: 'recepes#index', as: 'recepes_index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
