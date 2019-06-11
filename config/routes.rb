Rails.application.routes.draw do
  resources :tickets
  resources :banks
  resources :states
  resources :charges
  resources :documents
  devise_for :users
  resources :providers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
