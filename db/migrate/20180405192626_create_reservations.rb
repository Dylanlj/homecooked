class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.integer :number_of_people

      t.timestamps
    end
  end
end
