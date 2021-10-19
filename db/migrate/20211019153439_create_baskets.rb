# frozen_string_literal: true

class CreateBaskets < ActiveRecord::Migration[6.1]
  def change
    create_table :baskets, &:timestamps
  end
end
