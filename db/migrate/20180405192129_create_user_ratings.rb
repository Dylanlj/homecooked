class CreateUserRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :user_ratings do |t|
      t.integer :ratee_id
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end
