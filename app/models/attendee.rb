class Attendee < ApplicationRecord
  has_many :event_tickets
  has_many :attended_events, through: :event_tickets, source: :event
  def self.authenticate(email, password)
    attendee = Attendee.find_by(email: email)
    return attendee if attendee && attendee.password == password
  end

  def attended_events
    Event.joins(:event_tickets).where(event_tickets: { attendee_id: id })
  end

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :phone, presence: true, uniqueness: true
  validates :address, presence: true
  validates :credit_card, presence: true, uniqueness: true
end
