require 'rails_helper'

RSpec.describe Product, type: :model do

  context "Verify Association" do
    before(:each) do
      customer_role = Role.create(name: "Customer")
      operator_role = Role.create(name: "Operator")
      customer_user = User.create(email: "customer@gmail.com", password: "password", role_id: customer_role.id)
      operator_user = User.create(email: "operator@gmail.com", password: "password", role_id: operator_role.id)
      @customer = Customer.create(first_name: "name", last_name: "lastname", mobile_num: "1234567890", family_members: 5, address: "saykhind", user_id: customer_user.id)
      @operator = Operator.create(first_name: "name", middle_name: "middlename", last_name: "lastname", mobile: "1234567890", permanent_address: "saykhind", mail: "name@gmail.com", salary: 5000, user_id: operator_user.id)
      @product = Product.create(product_name: "bajari", price: 10, weight: 5, customer_id: @customer.id, operator_id: @operator.id, payment_type: "cash")
    end

    it "should belongs to customer" do
      expect(@customer).to eq(@product.customer)
    end

    it "should belongs to operator" do
      expect(@operator).to eq(@product.operator)
    end
  end

  context "validation" do
    context "product_name" do
      it "gives validation error on presence true" do
        customer_role = Role.create(name: "Customer")
        operator_role = Role.create(name: "Operator")
        customer_user = User.create(email: "customer@gmail.com", password: "password", role_id: customer_role.id)
        operator_user = User.create(email: "operator@gmail.com", password: "password", role_id: operator_role.id)
        customer = Customer.create(first_name: "name", last_name: "lastname", mobile_num: "1234567890", family_members: 5, address: "saykhind", user_id: customer_user.id)
        operator = Operator.create(first_name: "name", middle_name: "middlename", last_name: "lastname", mobile: "1234567890", permanent_address: "saykhind", mail: "name@gmail.com", salary: 5000, user_id: operator_user.id)
        product = Product.new(product_name: nil, price: 10, weight: 5, customer_id: customer.id, operator_id: operator.id, payment_type: "cash")
        product.save
        expect(product.errors.full_messages.first).to eq("Product name can't be blank")
      end

      it "gives validation error on characters only" do
        customer_role = Role.create(name: "Customer")
        operator_role = Role.create(name: "Operator")
        customer_user = User.create(email: "customer@gmail.com", password: "password", role_id: customer_role.id)
        operator_user = User.create(email: "operator@gmail.com", password: "password", role_id: operator_role.id)
        customer = Customer.create(first_name: "name", last_name: "lastname", mobile_num: "1234567890", family_members: 5, address: "saykhind", user_id: customer_user.id)
        operator = Operator.create(first_name: "name", middle_name: "middlename", last_name: "lastname", mobile: "1234567890", permanent_address: "saykhind", mail: "name@gmail.com", salary: 5000, user_id: operator_user.id)
        product = Product.new(product_name: 12345, price: 10, weight: 5, customer_id: customer.id, operator_id: operator.id, payment_type: "cash")
        product.save
        expect(product.errors.full_messages.first).to eq("Product name Write only small letter")
      end
    end
  end
end
