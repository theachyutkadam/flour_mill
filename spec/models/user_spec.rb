require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates user" do
  	role = Role.create!(name: "Admin")
    user = User.create!(email: "ravi@gmail.com", password: "password", role_id: role.id)
    expect(role.name).to eq("Admin")
    expect(user.email).to eq("ravi@gmail.com")
    expect(user.role_id).to eq(role.id)
  end

  it "should verify Admin user" do
		role = Role.create!(name: "Admin")
	  user = User.create!(email: "ravi@gmail.com", password: "password", role_id: role.id)
	  expect(user.admin?).to eq(true)
	  expect(user.operator?).to eq(false)
	  expect(user.customer?).to eq(false)
  end

  it "should verify Operator user" do
		role = Role.create!(name: "Operator")
	  user = User.create!(email: "ravi@gmail.com", password: "password", role_id: role.id)
	  expect(user.admin?).to eq(false)
	  expect(user.operator?).to eq(true)
	  expect(user.customer?).to eq(false)
  end

  it "should verify Customer user" do
		role = Role.create!(name: "Customer")
	  user = User.create!(email: "ravi@gmail.com", password: "password", role_id: role.id)
	  expect(user.admin?).to eq(false)
	  expect(user.operator?).to eq(false)
	  expect(user.customer?).to eq(true)
  end
end