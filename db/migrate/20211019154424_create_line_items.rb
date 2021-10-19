# frozen_string_literal: true

class CreateLineItems < ActiveRecord::Migration[6.1]
  def change
    create_table :line_items do |t|
      t.integer :quantity, null: false
      t.belongs_to :product
      t.belongs_to :basket

      t.timestamps
    end

    add_index :line_items, %i[product_id basket_id],
              name: 'line_items_product_id_basket_id',
              unique: true
  end
end
