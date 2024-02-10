json.extract! admin, :id, :email, :password, :name, :phone, :address, :credit_card, :created_at, :updated_at
json.url admin_url(admin, format: :json)
