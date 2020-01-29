# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :doctors, controllers: {
        sessions: 'doctors/sessions'
  }
  devise_for :patients, controllers: {
        sessions: 'patients/sessions'
  }
  resources :doctors do
    resources :appointments do
      get 'accept'
    end
  end
  resources :appointments
  resources :patients do
    resources :appointments
  end
  root to: 'appointments#index'
end
