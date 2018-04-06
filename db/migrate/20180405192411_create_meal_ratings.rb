class CreateMealRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :meal_ratings do |t|
      t.integer :meal_posting_id
      t.integer :user_id
      t.text :comment
      t.integer :rating

      t.timestamps
    end
  end
end
