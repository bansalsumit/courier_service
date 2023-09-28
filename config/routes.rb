Rails.application.routes.draw do
  resources :service_types
  resources :parcels
  resources :addresses
  resources :users
  root to: 'parcels#index'
  get '/search', to: 'search#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
