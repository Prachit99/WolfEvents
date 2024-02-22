class Room < ApplicationRecord
  has_many :event, dependent: :destroy
  has_many :event_tickets, dependent: :destroy

  validates :room_cap ,presence:true
  validates :room_loc ,presence:true

end
