# frozen_string_literal: true

# Products
# ========

products_info = { 'Green Tea' => { price: 3.11, code: 'GR1' },
                  'Strawberries' => { price: 5.00, code: 'SR1' },
                  'Coffe' => { price: 11.23, code: 'CF1' } }

products = products_info.map do |name, values|
  Product.find_or_create_by!(name: name,
                             code: values[:code],
                             price: values[:price])
end

# Discounts
# =========

discounts_info = { 'Discounts::TwoPerOne' => { priority: 2, quantity_condition: 2 },
                   'Discounts::DropUnitPrice' => { priority: 1, quantity_condition: 3 },
                   'Discounts::DropTotalPrice' => { priority: 3, quantity_condition: 3 } }

discounts_info.each_with_index do |(name, values), index|
  products[index].discounts
                 .find_or_create_by!(name: name,
                                     priority: values[:priority],
                                     quantity_condition: values[:quantity_condition])
end
