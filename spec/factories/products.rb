# frozen_string_literal: true

FactoryBot.define do
  sequence :product_name do |n|
    product_name = "Product_#{n}"
    while Product.find_by(name: product_name)
      n += 1
      product_name = "Product_#{n}"
    end
    product_name
  end
end

FactoryBot.define do
  sequence :product_code do |n|
    product_code = "ABC#{n}"
    while Product.find_by(code: product_code)
      n += 1
      product_code = "ABC#{n}"
    end
    product_code
  end
end

FactoryBot.define do
  factory :product do
    name { generate :product_name }
    code { generate :product_code }
    price { '1.09' }
  end
end
