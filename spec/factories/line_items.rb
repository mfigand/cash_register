# frozen_string_literal: true

FactoryBot.define do
  factory :line_item do
    quantity { 2 }
    product { create(:product) }
    basket { create(:basket) }
  end
end
