FactoryBot.define do
  factory :product do
    product_name "bajari"
    price 15
    weight 5
    association :customer_id, :factory => :customer
    association :operator_id, :factory => :operator
    payment_type "25"
    association :item_id, :factory => :item
    # association customer
    # association operator
  end 
end
