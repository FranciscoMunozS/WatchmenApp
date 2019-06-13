Rails.application.routes.draw do
  resources :tickets
  resources :banks
  resources :states
  resources :charges
  resources :documents
  devise_for :users
  resources :providers
  resources :dashboard

  get 'complete/:id', to: 'tickets#complete', as: :complete_tickets

  root 'dashboard#index'
end
