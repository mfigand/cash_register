# frozen_string_literal: true

class Discount < ApplicationRecord
  belongs_to :product

  validates :name,
            presence: true,
            uniqueness: { scope: %i[name product] }
  validates :priority, presence: true
  validates :quantity_condition, presence: true
end
