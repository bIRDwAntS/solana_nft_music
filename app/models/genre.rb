class Genre < ApplicationRecord
      # Relations
  has_and_belongs_to_many :albums

  # Validations
  validates :name, presence: true, uniqueness: true
end
