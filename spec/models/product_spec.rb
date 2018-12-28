require 'rails_helper'

RSpec.describe Product, type: :model do

  context "Verify Association" do
    before(:each) do
      role_operator = FactoryBot.create(:role, name: "Operator")
      role_customer = FactoryBot.create(:role, name: "Customer")
      user_operator = FactoryBot.create(:user, role_id: role_operator.id, email: "user_operator@gmail.com")
      user_customer = FactoryBot.create(:user, role_id: role_customer.id, email: "user_customer@gmail.com")
      @customer = FactoryBot.create(:customer, user_id: user_operator.id)
      @operator = FactoryBot.create(:operator, user_id: user_customer.id)
      @item = FactoryBot.create(:item)
      @product = FactoryBot.create(:product)
    end
    it "should belongs to customer" do
      expect(@customer).to eq(@product.customer)
    end
    it "should belongs to operator" do
      expect(@operator).to eq(@product.operator)
    end
    it "should belongs to item" do
      expect(@item).to eq(@product.item)
    end
  end

  context "validation" do
    context "product_name" do
      it "gives validation error on presence true" do
        role_operator = FactoryBot.create(:role, name: "Operator")
        role_customer = FactoryBot.create(:role, name: "Customer")
        user_operator = FactoryBot.create(:user, role_id: role_operator.id, email: "user_operator@gmail.com")
        user_customer = FactoryBot.create(:user, role_id: role_customer.id, email: "user_customer@gmail.com")
        @customer = FactoryBot.create(:customer, user_id: user_operator.id)
        @operator = FactoryBot.create(:operator, user_id: user_customer.id)
        @item = FactoryBot.create(:item)
        @product = FactoryBot.create(:product)
        @product.save
        expect(@product.errors.full_messages.first).to eq("Product name can't be blank")
      end
    end
  end

end