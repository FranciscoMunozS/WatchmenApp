Rails.application.routes.draw do
  resources :tickets
  resources :banks
  resources :states
  resources :charges
  resources :documents
  devise_for :users
  resources :providers
  resources :dashboard
  resources :users, only: [:index]

  default_url_options :host => "http://localhost:3000"

  get 'complete/:id', to: 'tickets#complete', as: :complete_tickets

  match "/delayed_job" => DelayedJobWeb, :anchor => false, :via => [:get, :post]

  root 'dashboard#index'
end
