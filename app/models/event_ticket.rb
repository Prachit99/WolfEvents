class EventTicket < ApplicationRecord
  belongs_to :attendee
  belongs_to :room
  belongs_to :event

  validates :confirmation_num ,presence:true
end
