class Track < ApplicationRecord
   # Relations
   belongs_to :album
   has_many :transactions
   has_one :user, through: :album
 
   # Validations
   validates :title, presence: true
   validates :track_number, presence: true, numericality: { only_integer: true, greater_than: 0 }
   validates :nft_address, uniqueness: true, allow_blank: true
   validates :price, numericality: { greater_than: 0 }, if: :individual_sale?
 
   # Callbacks
   before_validation :set_track_number, on: :create
 
   # Méthodes
   def formatted_duration
     return "0:00" if duration.blank?
     minutes = duration / 60
     seconds = duration % 60
     format("%d:%02d", minutes, seconds)
   end
 
   def mint_individual_nft
     # Logique pour créer un NFT individuel pour la piste
   end
 
   private
 
   def set_track_number
     return if track_number.present?
     max_number = album.tracks.maximum(:track_number) || 0
     self.track_number = max_number + 1
   end
   # Active Storage
  has_one_attached :audio_file
end
