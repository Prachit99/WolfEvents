json.extract! attendee, :id, :name, :email, :password, :phone, :address, :credit_card, :created_at, :updated_at
json.url attendee_url(attendee, format: :json)
