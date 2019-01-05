# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users, except: [:index, :destroy]
end
