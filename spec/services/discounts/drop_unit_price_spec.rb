# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Discounts::DropUnitPrice, type: :service do
  let(:quantity) { 3 }
  let(:price) { 3.05 }
  let(:balance) do
    { quantity: quantity,
      price: price,
      total: quantity * price }
  end
  let(:quantity_condition) { 3 }

  describe 'Success response' do
    it 'return balance after drop_unit_price discount successfully' do
      new_price = 4.5
      service = Discounts::DropUnitPrice.call(balance: balance,
                                              quantity_condition: quantity_condition)

      expect(service.success?).to be(true)
      expect(service.data[:balance][:price]).to be(new_price)
    end
  end

  describe 'Failure response' do
    it 'shoud fail by missing balance' do
      service = Discounts::DropUnitPrice.call(balance: nil,
                                              quantity_condition: quantity_condition)

      expect(service.failure?).to be(true)
    end
  end
end
