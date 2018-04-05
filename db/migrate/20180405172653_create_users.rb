class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :user_status
      t.string :address
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :phone_number
      t.string :image

      t.timestamps
    end
  end
end
