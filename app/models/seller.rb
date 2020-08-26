class Seller < User
  default_scope { where(seller: true) }

  has_many :products
end
