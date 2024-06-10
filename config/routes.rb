Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :events, only: [:index, :new, :create, :show]
  resources :users, only: [:show]

  root to: 'events#index'
end
