class AddDeleteStatusToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :delete_status, :string
  end
end
