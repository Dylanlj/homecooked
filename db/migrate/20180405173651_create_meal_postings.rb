class CreateMealPostings < ActiveRecord::Migration[5.1]
  def change
    create_table :meal_postings do |t|
      t.integer :user_id
      t.integer :category_id
      t.integer :base_time
      t.integer :end_time
      t.string :title
      t.text :description
      t.string :allergy_notice
      t.integer :servings
      t.integer :cost

      t.timestamps
    end
  end
end
