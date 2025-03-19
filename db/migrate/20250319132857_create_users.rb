class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :wallet_address
      t.text :bio
      t.string :profile_image
      t.boolean :artist
      t.integer :role

      t.timestamps
    end
  end
end
