json.extract! address, :id, :address_line_one, :address_line_two, :city, :state, :country, :pincode, :mobile_number, :user_id, :created_at, :updated_at
json.url address_url(address, format: :json)
