# frozen_string_literal: true

Rails.application.routes.draw do
  root 'user_sessions#new'

  resources :users, only: [:new, :create, :show]
  resources :user_sessions, only: [:new, :create, :destroy]
end
