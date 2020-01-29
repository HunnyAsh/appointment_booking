class AddFromToAvailabilityToDoctor < ActiveRecord::Migration[5.2]
  def change
    add_column :doctors, :from_time, :datetime
    add_column :doctors, :to_time, :datetime
  end
end
