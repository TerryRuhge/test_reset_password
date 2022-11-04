# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  get '/member/rider_info', to: 'member#rider_info'
  get '/member/all_statuses', to: 'member#all_statuses'
  
  get '/assignments/riding', to: 'assignments#riding' 
  get '/assignments/done', to: 'assignments#done' 
  #get '/assignments/queue', to: 'assignments#show_all_queue'
  #get '/assignments/assign', to: 'assignments#new'
  
  get '/requests/incoming', to: 'requests#incoming'
  get '/requests/waiting', to: 'requests#waiting'
  

  devise_for :members, controllers: {
    registrations: 'members/registrations',
    sessions: 'members/sessions',
    omniauth_callbacks: 'members/omniauth_callbacks'
  }
  
  resources :whitelists
  resources :drivers

  resources :requests do
    # pages handling buttons or actions
    get 'status'
    post 'cancel'
  end

  resources :assignments do
    # pages handling buttons or actions
    post 'picked_up'
    post 'dropped_off'
    get 'notes'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
