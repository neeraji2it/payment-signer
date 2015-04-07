Rails.application.routes.draw do
  root "payments#index"

  resources :payments
end
