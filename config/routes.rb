Rails.application.routes.draw do
  root "payments#index"

  resources :payments do
    member do
      get :document
    end
  end
end
