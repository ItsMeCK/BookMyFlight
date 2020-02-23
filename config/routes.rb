Rails.application.routes.draw do
  get 'bookings/view_seat'
  get 'bookings/allocate_seat'
  resources :seat_configurations
  resources :passenger_bookings
  resources :passengers
  resources :bookings
  resources :flights
  resources :airports
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get 'homes/index'
  root "homes#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
