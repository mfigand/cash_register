# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LineItems::TotalPrice, type: :service do
  let(:quantity) { 4 }
  let(:line_item) { create(:line_item, quantity: quantity) }
  let(:two_per_one) do
    create(:discount, name: 'Discounts::TwoPerOne',
                      priority: 1,
                      product: line_item.product)
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

  describe 'Failure response' do
    it 'shoud fail total_price by missing line_item' do
      service = LineItems::TotalPrice.call(line_item: nil)

      expect(service.failure?).to be(true)
      expect(service.data[:error]).to eq("Error: undefined method `product' for nil:NilClass")
    end
  end
end
