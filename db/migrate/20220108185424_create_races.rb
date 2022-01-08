# frozen_string_literal: true

class CreateRaces < ActiveRecord::Migration[7.0]
  def change
    create_table :races do |t|
      t.integer :distance
      t.integer :duration
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
