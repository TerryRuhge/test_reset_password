# frozen_string_literal: true

Rails.application.routes.draw do
  resources :cars
  resources :whitelists
  resources :drivers
  root 'home#index'

  get "history", to: "history#index"
  get '/member/rider_info', to: 'member#rider_info'
  get '/member/all_statuses', to: 'member#all_statuses'
  get '/assignments/queue', to: 'assignments#show_all_queue'
  get '/assignments/assign', to: 'assignments#new'

  devise_for :members, controllers: {
    registrations: 'members/registrations',
    sessions: 'members/sessions',
    omniauth_callbacks: 'members/omniauth_callbacks'
  }

  resources :requests do
    get 'status', to: 'requests#status'
    get 'cancel'
  end

  resources :assignments do
    get 'picked_up'
    get 'dropped_off'
    get 'notes', to: 'assignments#notes'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
