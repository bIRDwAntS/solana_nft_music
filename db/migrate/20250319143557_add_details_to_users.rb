class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    # Vérifiez chaque colonne avant de l'ajouter
    add_column :users, :wallet_address, :string unless column_exists?(:users, :wallet_address)
    add_column :users, :bio, :text unless column_exists?(:users, :bio)
    add_column :users, :artist, :boolean, default: false unless column_exists?(:users, :artist)
    add_column :users, :role, :integer, default: 0 unless column_exists?(:users, :role)
    
    # Ajoutez des index si nécessaire
    add_index :users, :wallet_address, unique: true unless index_exists?(:users, :wallet_address)
  end
end