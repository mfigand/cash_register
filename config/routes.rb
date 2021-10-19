# frozen_string_literal: true

Rails.application.routes.draw do
  root 'products#index'

  resources :products

  resources :baskets, only: %i[show destroy]

  resources :line_items, only: %i[create show update destroy]

  post 'line_items/:id/add' => 'line_items#add', as: 'line_item_add'
  post 'line_items/:id/subtract' => 'line_items#subtract', as: 'line_item_subtract'
end
