class Attendee < ApplicationRecord
  has_many :event_tickets, dependent: :destroy
  has_many :attended_events, through: :event_tickets, source: :event
  has_many :reviews, dependent: :destroy
  def self.authenticate(email, password)
    attendee = Attendee.find_by(email: email)
    return attendee if attendee && attendee.password == password
  end

  def attended_events
    Event.joins(:event_tickets)
         .where(event_tickets: { attendee_id: id })
         .where("events.event_end_time < ?", Time.now)
         .where.not(events: { event_cat: "Miscellaneous/Family – Private" })
  end

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :phone, presence: true, uniqueness: true, format: { with: /\A\d{10}\z/, message: "must be 10 digits" }
  validates :address, presence: true
  validates :credit_card, presence: true, uniqueness: true, format: { with: /\A\d{16}\z/, message: "must be 16 digits" }
end
