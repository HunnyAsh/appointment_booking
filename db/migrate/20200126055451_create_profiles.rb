# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.bigint :profileable_id
      t.string :profileable_type
      t.timestamps
    end
    add_index :profiles, %i[profileable_type profileable_id]
  end
end
