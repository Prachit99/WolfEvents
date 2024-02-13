class Event < ApplicationRecord
  has_many :attendees
  has_many :event_tickets
  belongs_to :room

  validates :event_name, presence: true
  validates :event_cat, presence: true
  validates :event_date, presence:true
  validates :event_start_time, presence:true
  validates :event_end_time, presence: true
  validates :ticket_price, numericality: { greater_than_or_equal_to:0}
  validates :no_of_seats, numericality: { greater_than_or_equal_to:0}
end
