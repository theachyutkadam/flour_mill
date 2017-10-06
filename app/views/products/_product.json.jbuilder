json.extract! product, :id, :product_name, :price, :weight, :customer_id, :operator_id, :created_at, :updated_at
json.url product_url(product, format: :json)
