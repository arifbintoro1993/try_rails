Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root Route
  root to: "main#index"

  # About us Route
  get "about-us", to: "about#index", as: :about

  # Sign Up Route
  get "sign-up", to: "registrations#new"
  post "sign-up", to: "registrations#create"

  # Sign In Route
  get "sign-in", to: "session#new"
  post "sign-in", to: "session#create"

  # Logout Route
  delete "logout", to: "session#destroy"

  # Password
  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  get "home", to: "thought#index", as: :home
  post "thought/post/", to: "thought#create"

  post "thought/:id/like", to: "like#create", as: :like

  post "api/auth", to: "auth#login", as: :api_auth
end
