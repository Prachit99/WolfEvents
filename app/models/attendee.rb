class Attendee < ApplicationRecord
  def self.authenticate(email, password)
    attendee = Attendee.find_by(email: email)
    return attendee if attendee && attendee.password == password
  end
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true
  validates :address, presence: true
  validates :credit_card, presence: true, uniqueness: true
end
