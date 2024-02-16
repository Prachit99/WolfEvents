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

  scope :upcoming, -> { where('event_date >= ?', Date.today) }
  scope :not_sold_out, -> { where('no_of_seats > 0') }

  def self.filter(filter_type, filter_value)
    scoped_events = case filter_type
                    when 'category'
                      where(event_cat: filter_value)
                    when 'date'
                      where(event_date: filter_value)
                    when 'price'
                      where(ticket_price: filter_value)
                    else
                      all
                    end

    scoped_events.order(:event_date)
  end
  # scope :visible_to_user, ->(user) {
  #   if user&.admin?
  #     all # Admin can see all events
  #   elsif user&.attendee?
  #     upcoming.not_sold_out # Attendees can see upcoming events that are not sold out
  #   else
  #     none # Default to no events for other roles (optional)
  #   end
  # }
end
