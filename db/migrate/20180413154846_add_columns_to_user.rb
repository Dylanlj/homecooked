class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :latitude, :decimal, :precision => 15, :scale => 13
    add_column :users, :longitude, :decimal, :precision => 15, :scale => 13
  end
end
