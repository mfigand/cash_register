# frozen_string_literal: true

Rails.application.routes.draw do
  root 'products#index'

  resources :products

  resources :baskets, only: %i[show destroy]

  resources :line_items, only: %i[create update destroy]
end
