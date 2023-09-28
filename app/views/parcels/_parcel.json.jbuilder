json.extract! parcel, :id, :weight, :status, :service_type_id, :payment_mode, :sender_id, :receiver_id, :cost, :created_at, :updated_at
json.url parcel_url(parcel, format: :json)
