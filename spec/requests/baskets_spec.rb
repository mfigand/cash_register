# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Baskets', type: :request do
  let(:basket) { create(:basket) }

  describe 'GET /show' do
    it 'renders a successful response' do
      get basket_url(basket)
      expect(response).to be_successful
    end
  end

  describe 'DELETE /destroy' do
    it 'redirects to the baskets list' do
      delete basket_url(basket)
      expect(response).to redirect_to(root_url)
    end
  end
end
