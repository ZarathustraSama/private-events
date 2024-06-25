Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :events
  resources :users, only: [:show]
  resources :event_attendees, only: [:create]

  root to: 'events#index'
end
