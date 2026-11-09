Rails.application.routes.draw do
  root "plants#index"
  resources :plants, only: [:index, :show]
  resources :families, only: [:index, :show], controller: "groups", defaults: { group: "families" }
  resources :habitats, only: [:index, :show], controller: "groups", defaults: { group: "habitats" }
  resources :garden_uses, only: [:index, :show], controller: "groups", defaults: { group: "garden_uses" }
  get "about", to: "pages#about"
end
