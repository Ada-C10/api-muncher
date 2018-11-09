Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'search#new'

# get '', to: 'search#new', as: 'search_new'

post '/search', to: 'search#index', as: 'search_create'

get ':keyword', to: 'search#index', as: 'search_index'

get ':recipe/show', to: 'search#show', as: 'search_detail'
# resources :search

end
