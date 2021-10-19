# frozen_string_literal: true

module LineItems
  class Create < Micro::Case
    attributes :product, :basket

    def call!
      ActiveRecord::Base.transaction do
        Success result: { line_item: line_item }
      rescue StandardError => e
        Failure result: { error: "Error: #{e.message}" }
      end
    end

    private

    def line_item
      @_line_item ||= LineItem.create!(attributes.merge(quantity: 1))
    end
  end
end
