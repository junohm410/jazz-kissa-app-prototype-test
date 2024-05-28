Rails.application.routes.draw do
  get 'home/index'
  resources :artists
  resources :records
  resources :jazz_cafes
  resources :diaries

  namespace :api do
    resources :jazz_cafes, only: [:index]
    resources :records, only: [:index]
    resources :artists, only: [:index]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root 'home#index'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
end
