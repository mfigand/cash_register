# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'LineItems', type: :request do
  let(:line_item) { create(:line_item) }
  let(:valid_attributes) do
    line_item.attributes
  end
  let(:invalid_attributes) do
    { quantity: nil,
      product: nil,
      basket: nil }
  end
  let(:product) { create(:product) }

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new LineItems' do
        expect do
          post line_items_url, params: { product_id: product.id }
        end.to change(LineItem, :count).by(1)
      end

      it 'redirects to the created line_item' do
        post line_items_url, params: { product_id: product.id }
        expect(response).to have_http_status(302)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new LineItem' do
        expect do
          post line_items_url, params: { product_id: nil }
        end.to change(LineItem, :count).by(0)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested line_item' do
      line_item
      expect do
        delete line_item_url(line_item)
      end.to change(LineItem, :count).by(-1)
    end

    it 'redirects to the line_items list' do
      delete line_item_url(line_item)
      expect(response).to have_http_status(302)
    end
  end
end
