class AddImageToMealPostings < ActiveRecord::Migration[5.1]
  def change
    add_column :meal_postings, :image, :string, default: "https://www.publicdomainpictures.net/pictures/160000/velka/table-place-setting.jpg"
  end
end
