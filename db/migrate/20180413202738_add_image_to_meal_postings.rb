class AddImageToMealPostings < ActiveRecord::Migration[5.1]
  def change
    add_column :meal_postings, :image, :string
  end
end
