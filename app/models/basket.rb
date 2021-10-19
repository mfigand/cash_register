# frozen_string_literal: true

class Basket < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  def sub_total
    line_items.inject(0) do |sum, line_item|
      sum + line_item.total_price
    end
  end
end
