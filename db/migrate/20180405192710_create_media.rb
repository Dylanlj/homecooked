class CreateMedia < ActiveRecord::Migration[5.1]
  def change
    create_table :media do |t|
      t.integer :meal_posting_id
      t.string :url

      t.timestamps
    end
  end
end
