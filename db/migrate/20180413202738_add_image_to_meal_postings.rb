class AddImageToMealPostings < ActiveRecord::Migration[5.1]
  def change
    add_column :meal_postings, :image, :string, default: "http://res.cloudinary.com/drdumqp4e/image/upload/v1524003936/table-place-setting.jpg"
  end
end
