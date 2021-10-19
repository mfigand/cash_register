# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LineItem, type: :model do
  let(:line_item) { build(:line_item) }

  describe 'validations' do
    it 'Create a valid line_item' do
      expect(line_item).to be_valid
      expect(line_item.save).to be(true)
    end

    it 'Not be valid with invalid params' do
      expect do
        new_line_item = LineItem.new(quantity: nil,
                                     product: nil,
                                     basket: nil)
        expect(new_line_item).to_not be_valid
        expect(new_line_item.save).to be(false)
        expect(new_line_item.errors).to include(:product)
        expect(new_line_item.errors).to include(:basket)
      end.to change(LineItem, :count).by(0)
    end

    it 'Not be valid with same [product, basket] combination' do
      line_item.save!
      expect do
        new_line_item = LineItem.new(quantity: 2,
                                     product: line_item.product,
                                     basket: line_item.basket)
        expect(new_line_item).to_not be_valid
        expect(new_line_item.save).to be(false)
      end.to change(LineItem, :count).by(0)
    end
  end
end
