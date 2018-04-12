class AddPaidToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :paid, :string
  end
end
