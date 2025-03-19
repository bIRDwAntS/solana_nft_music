class CreateTracks < ActiveRecord::Migration[7.1]
  def change
    create_table :tracks do |t|
      t.string :title
      t.integer :duration
      t.string :audio_file
      t.references :album, null: false, foreign_key: true
      t.integer :track_number
      t.string :nft_address
      t.boolean :individual_sale
      t.decimal :price

      t.timestamps
    end
  end
end
