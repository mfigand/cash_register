# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Basket, type: :model do
  let(:basket) { build(:basket) }
  let(:line_item) { build(:line_item) }

  before do
    basket.line_items << line_item
  end

  describe '#sub_total' do
    it 'should return sub_total of all items' do
      expect(basket.sub_total).to eq(line_item.total_price)
    end
  end
end
