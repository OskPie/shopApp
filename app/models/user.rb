class User < ApplicationRecord
  EMAIL_FORMAT = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :email, presence: true, format: { with: EMAIL_FORMAT }
  validates :email, uniqueness: true
  validates :firstname, :lastname, :password, presence: true

  has_secure_password

  def name
    "#{firstname} #{lastname}".strip
  end
end
