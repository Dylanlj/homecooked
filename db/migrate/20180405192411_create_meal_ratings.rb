class CreateMealRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :meal_ratings do |t|
      t.text :comment
      t.integer :rating

      t.timestamps
    end
  end
end
