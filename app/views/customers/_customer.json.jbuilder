json.extract! customer, :id, :first_name, :middle_name, :last_name, :address, :mobile_num, :created_at, :updated_at
json.url customer_url(customer, format: :json)
