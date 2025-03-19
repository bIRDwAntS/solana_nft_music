class Album < ApplicationRecord
    # Relations
    belongs_to :user
    has_many :tracks, dependent: :destroy
    has_and_belongs_to_many :genres
    has_many :transactions
  
    # Enums
    enum mint_status: { draft: 0, pending: 1, minted: 2, failed: 3 }
  
    # Validations
    validates :title, presence: true
    validates :royalty_percentage, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 50 }
    validates :nft_address, uniqueness: true, allow_blank: true
  
    # Méthodes
    def total_duration
      tracks.sum(:duration)
    end
  
    def mint_nft
      # Logique pour créer un NFT sur Solana
    end

      # Active Storage
  has_one_attached :cover_image
end
