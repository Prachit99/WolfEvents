Rails.application.routes.draw do
  resources :reviews
  resources :event_tickets
  resources :events
  resources :attendees
  resources :rooms
  resources :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
