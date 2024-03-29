Rails.application.routes.draw do
  root to: 'products#index'
  devise_for :users
  resources :products
  resources :payments
  get 'success_payments', to: 'payments#success', as: 'success_payments'
end
