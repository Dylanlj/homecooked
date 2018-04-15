class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.integer :meal_posting_id
      t.integer :user_id
      t.integer :number_of_people
      t.string  :allergies
      t.time :time
      t.string  :status

      t.timestamps
    end
  end
end
