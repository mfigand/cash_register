# frozen_string_literal: true

module Discounts
  class Base < Micro::Case
    attributes :balance, :quantity_condition

    def call!
      Failure result: { error: 'Error: this method should not be call directly' }
    end

    private

    def new_balance
      { quantity: new_quantity,
        price: new_price,
        total: new_total }
    end

    def new_quantity
      balance[:quantity]
    end

    def new_price
      balance[:price]
    end

    def new_total
      new_quantity * new_price
    end
  end
end
