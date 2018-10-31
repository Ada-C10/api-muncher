Rails.application.routes.draw do
    root 'sessions#root'
    get "/auth/github/callback", to: "sessions#create", as: 'auth_callback'
end
