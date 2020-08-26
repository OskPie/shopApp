class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validate :amount_of_products

  after_save :update_product_quantity

  private

  def amount_of_products
    unless amount <= product.quantity
      errors.add(:base, 'Amount of your order is to high')
    end
  end

  def update_product_quantity
    product.update_attributes(quantity: product.quantity - amount)
  end
end
