class Seller < User
  default_scope { where(seller: true) }
end
