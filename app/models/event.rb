class Event < ApplicationRecord
  has_many :attendees
  has_many :event_tickets
  belongs_to :room
  has_many :reviews

  validates :event_name, presence: true
  validates :event_cat, presence: true
  validates :event_date, presence:true
  validates :event_start_time, presence:true
  validates :event_end_time, presence: true
  validates :ticket_price, numericality: { greater_than_or_equal_to:0}
  validates :no_of_seats, numericality: { greater_than_or_equal_to:0}

  scope :upcoming, -> { where('event_date >= ?', Date.today) }
  scope :not_sold_out, -> { where('no_of_seats > 0') }
  scope :past, -> { where("event_date < ? OR (event_date = ? AND event_end_time < ?)", Date.today, Date.today, Time.now.strftime("%H:%M")) }

  def self.filter(filter_type, filter_value)
    case filter_type
    when 'category'
      where(event_cat: filter_value)
    when 'event_date'
      where('event_date = ?', filter_value.to_date)
    when 'price'
      where(ticket_price: filter_value)
    else
      all
    end
  end

end
