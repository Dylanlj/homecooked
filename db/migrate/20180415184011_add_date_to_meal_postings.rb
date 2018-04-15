class AddDateToMealPostings < ActiveRecord::Migration[5.1]
  def change
    add_column :meal_postings, :date, :date
  end
end
