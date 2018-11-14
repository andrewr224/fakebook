# frozen_string_literal: true

Rails.application.routes.draw do
  resources :user_sessions, only: [:new, :create, :destroy]
end
