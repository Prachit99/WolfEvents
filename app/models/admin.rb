class Admin < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true
  validates :address, presence: true
  validates :credit_card, presence: true, uniqueness: true
end
