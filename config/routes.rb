# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  post 'populate_from_csv', to: 'database#populate_from_csv'
  resources :deputies, only: %i[index show]
end
