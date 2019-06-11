Rails.application.routes.draw do
  resources :tickets
  resources :banks
  resources :states
  resources :charges
  resources :documents
  devise_for :users
  resources :providers

  root 'tickets#index'
end
