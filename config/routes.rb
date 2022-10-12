# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  
  get "/member/rider_info", to: "member#rider_info"
  devise_for :members, controllers: {
     registrations:'members/registrations',
     sessions: 'members/sessions',
     omniauth_callbacks: 'members/omniauth_callbacks'
    }
	
  resources :riders

  resources :requests do
    get 'edit_status', to: 'requests#status', as: 'status'
    get 'cancel'
  end
  
  resources :assignments do
	get 'picked_up'
	get 'dropped_off'
	get 'edit_notes', to: 'assignments#notes', as: 'notes'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
