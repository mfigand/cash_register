# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { build(:product) }

  describe 'validations' do
    it 'Create a valid product' do
      expect(product).to be_valid
      expect(product.save).to be(true)
    end

    it 'Not be valid with invalid params' do
      expect do
        new_product = Product.new(name: nil,
                                  code: nil,
                                  price: 1.05)
        expect(new_product).to_not be_valid
        expect(new_product.save).to be(false)
        expect(new_product.errors).to include(:name)
        expect(new_product.errors).to include(:code)
      end.to change(Product, :count).by(0)
    end

    it 'Not be valid with missing code' do
      expect do
        new_product = Product.new(name: 'Name',
                                  code: nil,
                                  price: 1.05)
        expect(new_product).to_not be_valid
        expect(new_product.save).to be(false)
      end.to change(Product, :count).by(0)
    end

    it 'Not be valid with same name' do
      product.save!
      expect do
        new_product = Product.new(name: product.name,
                                  code: 'Code',
                                  price: 1.05)
        expect(new_product).to_not be_valid
        expect(new_product.save).to be(false)
      end.to change(Product, :count).by(0)
    end
  end
end
