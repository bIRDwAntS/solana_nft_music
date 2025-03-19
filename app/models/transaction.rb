class Transaction < ApplicationRecord
  # Relations
  belongs_to :seller, class_name: 'User'
  belongs_to :buyer, class_name: 'User'
  belongs_to :album, optional: true
  belongs_to :track, optional: true

  # Enums
  enum transaction_type: { primary_sale: 0, secondary_sale: 1, royalty_payment: 2 }
  enum status: { pending: 0, completed: 1, failed: 2 }

  # Validations
  validates :tx_hash, presence: true, uniqueness: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validate :album_or_track_present

  # Méthodes
  def verify_on_blockchain
    # Logique pour vérifier la transaction sur Solana
  end

  private

  def album_or_track_present
    if album.blank? && track.blank?
      errors.add(:base, "La transaction doit être associée à un album ou une piste")
    end
  end
end
