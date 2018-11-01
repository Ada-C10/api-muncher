Rails.application.routes.draw do
    root 'sessions#root'
    get "/auth/github/callback", to: "sessions#create", as: 'auth_callback'

    get '/search', to: 'searches#new', as: 'new_search' #where searches are routed to
    post ':channel', to: 'search#create', as: 'create_search'
end
