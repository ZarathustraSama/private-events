Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :events, only: [:index]
  resources :users, only: [:show]

  root to: 'events#index'
end
