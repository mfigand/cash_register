# frozen_string_literal: true

class CreateDiscounts < ActiveRecord::Migration[6.1]
  def change
    create_table :discounts do |t|
      t.string :name, null: false
      t.integer :priority, null: false
      t.integer :quantity_condition, null: false, default: 0
      t.belongs_to :product

      t.timestamps
    end
    add_index :discounts, :quantity_condition
    add_index :discounts, :priority
    add_index :discounts, %i[name product_id],
              name: 'discounts_name_product_id',
              unique: true
  end
end
