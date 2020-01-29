class AddColumnsToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :dob, :datetime
  end
end
