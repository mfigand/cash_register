# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LineItems::Update, type: :service do
  let(:old_quantity) { 1 }
  let(:new_quantity) { 4 }
  let(:line_item) { create(:line_item, quantity: old_quantity) }

  describe 'Success response' do
    it 'shoud add one to line_item quantity successfully' do
      expect(line_item.quantity).to eq(old_quantity)

      service = LineItems::Update.call(line_item: line_item,
                                       operation: 'add')

      expect(service.success?).to be(true)
      expect(line_item.reload.quantity).to eq(old_quantity + 1)
    end

    it 'shoud update line_item successfully' do
      expect(line_item.quantity).to eq(old_quantity)

      service = LineItems::Update.call(line_item: line_item,
                                       operation: 'update',
                                       quantity: new_quantity)

      expect(service.success?).to be(true)
      expect(line_item.reload.quantity).to eq(new_quantity)
    end
  end

  describe 'Failure response' do
    it 'shoud fail update line_item by missing line_item' do
      service = LineItems::Update.call(line_item: nil,
                                       operation: 'update',
                                       quantity: new_quantity)

      expect(service.failure?).to be(true)
      expect(service.data[:error]).to eq("Error: undefined method `update!' for nil:NilClass")
    end
  end
end
