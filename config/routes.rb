# frozen_string_literal: true

Rails.application.routes.draw do
  resources :cars
  resources :whitelists
  resources :drivers
  
  root 'home#index'

  get 'history', to: 'history#index'
  get '/member/rider_info', to: 'member#rider_info'
  get '/member/all_statuses', to: 'member#all_statuses'

  get '/requests/incoming', to: 'requests#incoming'
  get '/requests/waiting', to: 'requests#waiting'

  get '/assignments/riding', to: 'assignments#riding'
  get '/assignments/done', to: 'assignments#done'
  get '/assignments/queue', to: 'assignments#queue', as: 'search'

  devise_for :members, controllers: {
    registrations: 'members/registrations',
    sessions: 'members/sessions',
    omniauth_callbacks: 'members/omniauth_callbacks'
  }

  resources :whitelists
  resources :drivers

  # for end product, index and show not being used (so disable later on)
  resources :requests do
    # pages handling buttons or actions (at the moment, status isn't used)
    get 'status'
    post 'done'
    post 'cancel'

    get 'assign', to: 'assignments#assign', as: 'assign'
    post 'assign', to: 'assignments#create', as: 'create_assignment'
  end
  # post 'requests/:request_id/assign', to: 'assignments#create', as: 'create_assignment'

  # for end product, index and show not being used (so disable later on)
  resources :assignments do
    # pages handling buttons or actions
    post 'picked_up'
    post 'dropped_off'
    get 'notes'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
