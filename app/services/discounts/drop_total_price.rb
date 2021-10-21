# frozen_string_literal: true

module Discounts
  class DropTotalPrice < Base
    def call!
      ActiveRecord::Base.transaction do
        Success result: { balance: quantity_condition >= 3 ? new_balance : balance }
      rescue StandardError => e
        Failure result: { error: "Error: #{e.message}" }
      end
    end

    private

    def new_total
      (new_quantity * new_price) * (2 / 3.0)
    end
  end
end
