class RemoveConfirmableFromUsers < ActiveRecord::Migration[7.0]
  def up
    # Supprimer les index s'ils existent
    remove_index :users, :confirmation_token if index_exists?(:users, :confirmation_token)
    
    # Supprimer les colonnes liées à confirmable si elles existent
    remove_column :users, :confirmation_token if column_exists?(:users, :confirmation_token)
    remove_column :users, :confirmed_at if column_exists?(:users, :confirmed_at)
    remove_column :users, :confirmation_sent_at if column_exists?(:users, :confirmation_sent_at)
    remove_column :users, :unconfirmed_email if column_exists?(:users, :unconfirmed_email)
  end

  def down
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string
    add_index :users, :confirmation_token, unique: true
  end
end