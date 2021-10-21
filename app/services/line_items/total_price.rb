# frozen_string_literal: true

module LineItems
  class TotalPrice < Micro::Case
    attributes :line_item

    def call!
      ActiveRecord::Base.transaction do
        apply_discounts

        Success result: { total_price: balance[:total] }
      rescue StandardError => e
        Failure result: { error: "Error: #{e.message}" }
      end
    end

    private

    def apply_discounts
      discounts.order(priority: :asc).map do |discount|
        service = discount.name
                          .constantize
                          .call(balance: balance,
                                quantity_condition: line_item.quantity)
        @_balance = service.data[:balance]
      end
    end

    def balance
      @_balance ||= { quantity: original_quantity,
                      price: original_price,
                      total: original_quantity * original_price }
    end

    def discounts
      line_item.product.discounts
    end

    def original_quantity
      @_original_quantity ||= line_item.quantity
    end

    def original_price
      @_original_price ||= line_item.product.price
    end
  end
end
