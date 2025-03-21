class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :confirmable, :trackable
  
    # Relations
  has_many :albums, dependent: :destroy
  has_many :tracks, through: :albums
  has_many :sales, class_name: 'Transaction', foreign_key: 'seller_id'
  has_many :purchases, class_name: 'Transaction', foreign_key: 'buyer_id'

  # Enums
  enum role: { regular: 0, admin: 1 }

  # Validations
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :wallet_address, uniqueness: true, allow_blank: true

  # Méthodes
  def total_sales
    sales.sum(:amount)
  end

  def total_royalties
    # Logique pour calculer les royalties reçues
  end
   # Active Storage
   has_one_attached :profile_image
end
