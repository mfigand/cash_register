# frozen_string_literal: true

module LineItems
  class Update < Micro::Case
    attributes :line_item, :operation, :quantity

    def call!
      ActiveRecord::Base.transaction do
        process!

        Success result: { line_item: line_item }
      rescue StandardError => e
        Failure result: { error: "Error: #{e.message}" }
      end
    end

    private

    def add_quantity
      line_item.update!(quantity: line_item.quantity += 1)
    end

    def process!
      if operation == 'add'
        add_quantity
      else
        update_quantity
      end
    end

    def update_quantity
      line_item.update!(quantity: quantity) if quantity >= 0
    end
  end
end
