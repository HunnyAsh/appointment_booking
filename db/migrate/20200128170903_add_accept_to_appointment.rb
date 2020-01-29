class AddAcceptToAppointment < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :accept, :boolean, default: false
  end
end
