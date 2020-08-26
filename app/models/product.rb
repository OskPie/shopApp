class Product < ApplicationRecord
  belongs_to :seller  
  has_many :orders

  validates :name, :code, uniqueness: true
  validates :name, :quantity, presence: true
  validates :quantity, numericality: { greater_than: 0 }

  before_validation unless: :code? do
    self.code = SecureRandom.hex(6)
  end
end
