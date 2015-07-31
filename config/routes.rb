Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "payments#index"

  resources :payments do
    collection do
      get :import
    end
    member do
      get :payment_pdf
      get :next_step
      get :thankyou
    end
  end
  resources :signatures, only: [:create]
  devise_for :users
end
