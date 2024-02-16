Rails.application.routes.draw do
  resources :reviews
  resources :event_tickets
  resources :events do
    get 'upcoming_events', on: :collection
    get 'past_events', on: :collection
  end
  resources :attendees
  resources :rooms
  resources :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root 'home#index'
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: "attendees#new", as: 'signup'
  get 'login', to: "sessions#new", as: 'login'
  get 'logout', to: "sessions#destroy", as: 'logout'

end
