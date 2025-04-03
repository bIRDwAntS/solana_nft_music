class Album < ApplicationRecord
    # Relations
    belongs_to :user
    has_many :tracks, dependent: :destroy
    has_and_belongs_to_many :genres
    has_many :transactions, dependent: :nullify
  
    # Enums
    enum mint_status: { draft: 0, pending: 1, minted: 2, failed: 3 }
  
    # Validations
    validates :title, presence: true, length: { maximum: 100 }
    validates :description, presence: true
    validates :release_date, presence: true
    # validates :nft_address, uniqueness: true, allow_blank: true
    validates :royalty_percentage, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 50, allow_nil: true } #if set as allow_nil: true = form can be validated with no royalties set.  
    validate :acceptable_cover_image # validate cover image format and size
   
    private
    
    def acceptable_cover_image
      return unless cover_image.attached?
      
      # Check file size (max 5MB)
      unless cover_image.blob.byte_size <= 5.megabytes
        errors.add(:cover_image, "must be less than 5MB")
      end
      
      # Check content type
      acceptable_types = ["image/jpeg", "image/png", "image/gif"]
      unless acceptable_types.include?(cover_image.blob.content_type)
        errors.add(:cover_image, "must be a JPEG, PNG, or GIF")
      end
    end

    # Méthodes
    def total_duration
      tracks.sum(:duration)
    end
  
    def mint_nft
      # Logique pour créer un NFT sur Solana
    end

     # Active Storage association for cover image
  has_one_attached :cover_image
end
