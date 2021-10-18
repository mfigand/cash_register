# frozen_string_literal: true

# Products
# ========

products = { 'Green Tea' => { price: 3.11, code: 'GR1' },
             'Strawberries' => { price: 5.00, code: 'SR1' },
             'Coffe' => { price: 11.23, code: 'CF1' } }

products.each do |name, values|
  Product.find_or_create_by!(name: name,
                             code: values[:code],
                             price: values[:price])
end
