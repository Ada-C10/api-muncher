Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root 'chat#index' 'welcome#index' ? put edit update params? b/c search bar in index
  # search as a post or put -- own route

  root 'recipes#search_splash'
  post '/recipes', to: 'recipes#searcher', as: "searcher"
  get '/recipes', to: 'recipes#index', as: 'recipes'
  get '/recipes/:uri_num/', to: 'recipes#show', as: 'recipe'

end
