json.extract! event, :id, :event_name, :event_cat, :event_date, :event_start_time, :event_end_time, :ticket_price, :no_of_seats, :created_at, :updated_at
json.url event_url(event, format: :json)
