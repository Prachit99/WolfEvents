class Room < ApplicationRecord
  has_one :events
  has_many :event_tickets

  validates :room_cap ,presence:true
  validates :room_loc ,presence:true

end
