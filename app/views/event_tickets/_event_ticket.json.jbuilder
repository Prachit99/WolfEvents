json.extract! event_ticket, :id, :confirmation_num, :created_at, :updated_at
json.url event_ticket_url(event_ticket, format: :json)
