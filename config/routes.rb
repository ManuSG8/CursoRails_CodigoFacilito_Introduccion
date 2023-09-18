Rails.application.routes.draw do
  get "/bienvenida", to: "home#index"

  get "articles/new", to: "articles#new"
  post "articles", to: "articles#create"
end
