# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users do
    resources :messages, only: [:index]
  end
end
