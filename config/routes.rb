Rails.application.routes.draw do
  resources :tickets
  resources :banks
  resources :charges
  devise_for :users
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end
  resources :users
  resources :providers
  resources :dashboard

  default_url_options :host => "http://localhost:3000"

  get 'complete/:id', to: 'tickets#complete', as: :complete_tickets

  match "/delayed_job" => DelayedJobWeb, :anchor => false, :via => [:get, :post]

  root 'dashboard#index'
end
