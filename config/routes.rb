Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :events, only: [:index]

  root to: "events#index"
end
