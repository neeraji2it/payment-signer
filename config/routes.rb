Rails.application.routes.draw do
  root "payments#index"

  resources :payments
  devise_for :users
end
