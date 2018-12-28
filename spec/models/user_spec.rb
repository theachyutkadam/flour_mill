require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates user" do
    role = FactoryBot.create(:role, name: "Admin")
    user = FactoryBot.create(:user, role_id: role.id)
    expect(role.name).to eq("Admin")
    expect(user.email).to eq(user.email)
    expect(user.role_id).to eq(role.id)
  end

  it "should verify Admin user" do
    role = FactoryBot.create(:role, name: "Admin")
    user = FactoryBot.create(:user, role_id: role.id)
    expect(user.admin?).to eq(true)
    expect(user.operator?).to eq(false)
    expect(user.customer?).to eq(false)
  end

  it "should verify Operator user" do
    role = FactoryBot.create(:role, name: "Operator")
    user = FactoryBot.create(:user, role_id: role.id)
    expect(user.admin?).to eq(false)
    expect(user.operator?).to eq(true)
    expect(user.customer?).to eq(false)
  end

  it "should verify Customer user" do
    role = FactoryBot.create(:role, name: "Customer")
    user = FactoryBot.create(:user, role_id: role.id)
    expect(user.admin?).to eq(false)
    expect(user.operator?).to eq(false)
    expect(user.customer?).to eq(true)
  end
end