# frozen_string_literal: true

class Product < ApplicationRecord
  validates :code, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
end
