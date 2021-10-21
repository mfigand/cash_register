# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LineItems::TotalPrice, type: :service do
  let(:quantity) { 4 }
  let(:price) { 6 }
  let(:product) { create(:product, price: price) }
  let(:line_item) { create(:line_item, quantity: quantity, product: product) }
  let(:two_per_one) do
    create(:discount, name: 'Discounts::TwoPerOne',
                      priority: 1,
                      product: line_item.product,
                      quantity_condition: 2)
  end
  let(:drop_unit_price) do
    create(:discount, name: 'Discounts::DropUnitPrice',
                      priority: 2,
                      product: line_item.product,
                      quantity_condition: 3)
  end
  let(:drop_total_price) do
    create(:discount, name: 'Discounts::DropTotalPrice',
                      priority: 3,
                      product: line_item.product,
                      quantity_condition: 3)
  end

  describe 'Success response' do
    it 'should return total_price after two_per_one discount successfully' do
      two_per_one
      new_total = (quantity - (quantity % 2)) / 2 * line_item.product.price
      service = LineItems::TotalPrice.call(line_item: line_item)

      expect(service.success?).to be(true)
      expect(service.data[:total_price]).to eq(new_total)
    end
  end

  it 'should return total_price after drop_unit_price discount successfully' do
    drop_unit_price
    service = LineItems::TotalPrice.call(line_item: line_item)

    expect(service.success?).to be(true)
    expect(service.data[:total_price]).to eq(quantity * 4.5)
  end

  it 'should return total_price after drop_total_price discount successfully' do
    drop_total_price
    service = LineItems::TotalPrice.call(line_item: line_item)

    expect(service.success?).to be(true)

    new_total = (quantity * price) * 2 / 3.0
    expect(service.data[:total_price].round(2)).to eq(new_total)
  end

  describe 'Failure response' do
    it 'shoud fail total_price by missing line_item' do
      service = LineItems::TotalPrice.call(line_item: nil)

      expect(service.failure?).to be(true)
      expect(service.data[:error]).to eq("Error: undefined method `product' for nil:NilClass")
    end
  end
end
