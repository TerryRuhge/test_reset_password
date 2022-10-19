# frozen_string_literal: true

Rails.application.routes.draw do
  resources :drivers
  root 'home#index'

  get '/member/rider_info', to: 'member#rider_info'
  devise_for :members, controllers: {
    registrations: 'members/registrations',
    sessions: 'members/sessions',
    omniauth_callbacks: 'members/omniauth_callbacks'
  }

  resources :riders do
    get 'requests', to: 'rider_requests#index'
    get 'requests/:request_id/request_cancel', to: 'rider_requests#cancel', as: 'request_cancel'

    get 'assignments', to: 'rider_assignments#index'
    get 'queue', to: 'rider_assignments#queue'
    get 'requests/:request_id/queue_cancel', to: 'rider_assignments#cancel', as: 'queue_cancel'
  end
  get 'search', to: 'riders#search'

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
