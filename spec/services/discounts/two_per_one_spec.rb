# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Discounts::TwoPerOne, type: :service do
  let(:quantity) { 2 }
  let(:price) { 3.05 }
  let(:balance) do
    { quantity: quantity,
      price: price,
      total: quantity * price }
  end
  let(:quantity_condition) { 2 }

  describe 'Success response' do
    it 'return balance after two_per_one discount successfully' do
      new_quantity = (quantity - (quantity % 2)) / 2
      service = Discounts::TwoPerOne.call(balance: balance,
                                          quantity_condition: quantity_condition)

      expect(service.success?).to be(true)
      expect(service.data[:balance][:quantity]).to be(new_quantity)
    end
  end

  describe 'Failure response' do
    it 'shoud fail by missing balance' do
      service = Discounts::TwoPerOne.call(balance: nil,
                                          quantity_condition: quantity_condition)

      expect(service.failure?).to be(true)
    end
  end
end
