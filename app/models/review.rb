class Review < ApplicationRecord
  belongs_to :attendee
  belongs_to :event


  def self.filter(filter_type, filter_value)
    case filter_type.downcase
    when 'event name'
      joins(:event).where('events.event_name = ?', filter_value)
    when 'attendee name'
      joins(:attendee).where('attendees.name = ?', filter_value)
    else
      all
    end
  end

  validates :rating, presence: true
  validates :feedback, presence: true

end
