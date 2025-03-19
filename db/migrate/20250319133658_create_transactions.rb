class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :tx_hash, null: false
      
      # Au lieu de références directes, utilisez des clés étrangères explicites
      t.bigint :seller_id, null: false
      t.bigint :buyer_id, null: false
      t.references :album, foreign_key: true
      t.references :track, foreign_key: true
      
      t.decimal :amount, precision: 15, scale: 8, null: false
      t.integer :transaction_type, default: 0
      t.integer :status, default: 0

      t.timestamps
    end
    
    add_index :transactions, :tx_hash, unique: true
    add_index :transactions, :seller_id
    add_index :transactions, :buyer_id
    
    # Ajoutez les contraintes de clé étrangère manuellement
    add_foreign_key :transactions, :users, column: :seller_id
    add_foreign_key :transactions, :users, column: :buyer_id
  end
end