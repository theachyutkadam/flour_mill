require 'rails_helper'

RSpec.describe Product, type: :model do
  it "should validate product names presence" do
  	operator = Operator.create(first_name: "firstname", last_name: "lastname", mobile: "1234567890", permanent_address: "address", salary: 10000)
  	product = Product.new(product_name: nil, price: 10, weight: 5, operator_id: operator.id, payment_type: "cash")
  	product.save
    expect(product.errors.full_messages.first).to eq("Product name can't be blank")
  end
end
