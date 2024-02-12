class Room < ApplicationRecord
  has_many :events
  has_many :event_tickets

  # Method to find available rooms for a given date and time range
  def self.available_rooms(date, start_time, end_time)
    reserved_room_ids = Event.where(date: date)
                             .where.not(
      '(? >= event_start_time AND ? <= event_end_time) OR (? >= event_start_time AND ? <= event_end_time)',
      start_time, start_time,
      end_time, end_time
    )
                             .pluck(:room_id)

    where.not(id: reserved_room_ids)
  end

end
