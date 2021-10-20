# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :discounts, dependent: :destroy

  validates :code, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
end
