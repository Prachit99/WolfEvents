class EventTicket < ApplicationRecord
  belongs_to :attendee, dependent: :destroy
  belongs_to :room
  belongs_to :event, dependent: :destroy

  validates :confirmation_num ,presence:true

  def self.filter(event_id, attendee_id)
    event_tickets = all

    if event_id.present? && attendee_id.present?
      event_tickets = event_tickets.where(event_id: event_id, attendee_id: attendee_id)
    elsif event_id.present?
      event_tickets = event_tickets.where(event_id: event_id)
    elsif attendee_id.present?
      event_tickets = event_tickets.where(attendee_id: attendee_id)
    end

    event_tickets
  end
end
