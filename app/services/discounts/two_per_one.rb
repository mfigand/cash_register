# frozen_string_literal: true

module Discounts
  class TwoPerOne < Base
    def call!
      ActiveRecord::Base.transaction do
        Success result: { balance: quantity_condition >= 2 ? new_balance : balance }
      rescue StandardError => e
        Failure result: { error: "Error: #{e.message}" }
      end
    end

    private

    def items_on_discount
      balance[:quantity] - items_without_discount
    end

    def items_without_discount
      @_items_without_discount ||= balance[:quantity] % 2
    end

    def new_quantity
      (items_on_discount / 2) + items_without_discount
    end
  end
end
