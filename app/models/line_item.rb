# frozen_string_literal: true

class LineItem < ApplicationRecord
  belongs_to :basket
  belongs_to :product

  validates :quantity,
            presence: true,
            uniqueness: { scope: %i[basket product] }

  def total_price
    quantity * product.price
  end
end
