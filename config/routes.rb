# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'products#index'

  resources :products
end
