Rails.application.routes.draw do
    get "/auth/github/callback", to: "sessions#create", as: 'auth_callback'
end
