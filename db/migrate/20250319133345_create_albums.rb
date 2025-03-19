class CreateAlbums < ActiveRecord::Migration[7.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :cover_image
      t.text :description
      t.date :release_date
      t.references :user, null: false, foreign_key: true
      t.string :nft_address
      t.decimal :royalty_percentage
      t.integer :mint_status

      t.timestamps
    end
  end
end
