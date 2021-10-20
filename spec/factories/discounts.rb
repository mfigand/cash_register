# frozen_string_literal: true

FactoryBot.define do
  sequence :discount_name do |n|
    discount_name = "Discount_#{n}"
    while Discount.find_by(name: discount_name)
      n += 1
      discount_name = "Discount_#{n}"
    end
    discount_name
  end
end

FactoryBot.define do
  factory :discount do
    name { generate :discount_name }
    priority { 1 }
    quantity_condition { 2 }
    product { create(:product) }
  end
end
