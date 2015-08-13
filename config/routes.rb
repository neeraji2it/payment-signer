Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "payments#index"

  resources :payments do
    member do
      get :payment_pdf
      get :next_step
      get :thankyou
      get :resend
    end
  end
  resources :signatures, only: [:new, :create]
  devise_for :users
end
