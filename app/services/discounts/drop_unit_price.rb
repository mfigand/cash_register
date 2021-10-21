# frozen_string_literal: true

module Discounts
  class DropUnitPrice < Base
    def call!
      ActiveRecord::Base.transaction do
        Success result: { balance: quantity_condition >= 3 ? new_balance : balance }
      rescue StandardError => e
        Failure result: { error: "Error: #{e.message}" }
      end
    end

    private

    def new_price
      4.5
    end
  end
end
