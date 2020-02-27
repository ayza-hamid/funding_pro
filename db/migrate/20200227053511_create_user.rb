# frozen_string_literal: true

class CreateUser < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :marital_status

      t.timestamps
    end
  end
end
