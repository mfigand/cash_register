# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LineItems::Create, type: :service do
  let(:product) { create(:product) }
  let(:basket) { create(:basket) }

  describe 'Success response' do
    it 'shoud create line_item successfully' do
      expect do
        service = LineItems::Create.call(product: product, basket: basket)

        expect(service.success?).to be(true)
      end.to change(LineItem, :count).by(1)
    end
  end

  describe 'Failure response' do
    it 'shoud fail create line_item by missing productd' do
      expect do
        service = LineItems::Create.call(product: nil, basket: basket)

        expect(service.failure?).to be(true)
        expect(service.data[:error]).to eq('Error: Validation failed: Product must exist')
      end.to change(LineItem, :count).by(0)
    end
  end
end
