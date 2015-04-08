Rails.application.routes.draw do
  root "payments#index"

  resources :payments do
    member do
      get :payment_pdf
    end
  end
  resources :signatures, only: [:create]
  devise_for :users
end
