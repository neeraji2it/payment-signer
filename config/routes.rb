Rails.application.routes.draw do
  root "payments#index"

  resources :payments
  resources :signatures, only: [:create]
  devise_for :users
end
