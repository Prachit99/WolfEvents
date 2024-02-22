class Room < ApplicationRecord
  has_one :event, dependent: :destroy
  has_many :event_tickets

  validates :room_cap ,presence:true
  validates :room_loc ,presence:true

end
