Rails.application.routes.draw do
  root 'event_schedules#index'
  resources :event_schedules
end