# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.decimal :price, null: false, precision: 8, scale: 2

      t.timestamps
    end
    add_index :products, :name, unique: true
    add_index :products, :code, unique: true
    add_index :products, :price
  end
end
