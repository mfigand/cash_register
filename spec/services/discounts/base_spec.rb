# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Discounts::Base, type: :service do
  describe 'Failure response' do
    it 'shoud fail by missing balance' do
      service = Discounts::Base.call

      expect(service.failure?).to be(true)
      expect(service.data[:error]).to eq('Error: this method should not be call directly')
    end
  end
end
