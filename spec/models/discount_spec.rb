# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Discount, type: :model do
  let(:discount) { build(:discount) }

  describe 'validations' do
    it 'Create a valid discount' do
      expect(discount).to be_valid
      expect(discount.save).to be(true)
    end

    it 'Not be valid with invalid params' do
      expect do
        new_discount = Discount.new(name: nil,
                                    priority: nil,
                                    quantity_condition: nil,
                                    product: nil)
        expect(new_discount).to_not be_valid
        expect(new_discount.save).to be(false)
        expect(new_discount.errors).to include(:name)
        expect(new_discount.errors).to include(:priority)
        expect(new_discount.errors).to include(:quantity_condition)
        expect(new_discount.errors).to include(:product)
      end.to change(Discount, :count).by(0)
    end

    it 'Not be valid with same name and product' do
      discount.save!
      expect do
        new_discount = Discount.new(name: discount.name,
                                    priority: 1,
                                    quantity_condition: 2,
                                    product: discount.product)
        expect(new_discount).to_not be_valid
        expect(new_discount.save).to be(false)
      end.to change(Discount, :count).by(0)
    end
  end
end
