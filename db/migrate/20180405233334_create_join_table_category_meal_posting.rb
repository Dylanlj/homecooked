class CreateJoinTableCategoryMealPosting < ActiveRecord::Migration[5.1]
  def change
    create_join_table :categories, :meal_postings do |t|
      t.index [:category_id, :meal_posting_id], name: "category_meal_id"
      t.index [:meal_posting_id, :category_id], name: "meal_category_id"
    end
  end
end

# generated was name was too long, and so I had to provide a shorter name
