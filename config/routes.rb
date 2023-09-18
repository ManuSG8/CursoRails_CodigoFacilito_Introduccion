Rails.application.routes.draw do
  get "/bienvenida", to: "home#index"

  get "articles/new", to: "articles#new"
  get "articles/:id", to: "articles#show"
  post "articles", to: "articles#create"
end
