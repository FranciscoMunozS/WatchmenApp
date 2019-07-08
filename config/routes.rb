Rails.application.routes.draw do
  resources :tickets
  resources :banks
  resources :charges
  devise_for :users
  scope '/admin' do
    resources :users
  end
  resources :providers
  resources :dashboard

  default_url_options :host => "http://localhost:3000"

  get 'complete/:id', to: 'tickets#complete', as: :complete_tickets

  match "/delayed_job" => DelayedJobWeb, :anchor => false, :via => [:get, :post]

  root 'dashboard#index'
end
