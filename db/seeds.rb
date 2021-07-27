# Role Records
puts "Creating Role..."
Role.find_or_create_by(name: "Admin")
Role.find_or_create_by(name: "Operator")
Role.find_or_create_by(name: "Customer")
puts "Role created successfully"

# Admin User
puts "Creating User..."
User.create(email: "admin@gmail.com", password: "password", role_id: 1)
puts "User created successfully"

puts "Creating Item..."
Item.create(item_name: "wheat", rate: 5)
puts "Item created successfully"
# Operator Users
puts "Creating Operator..."
User.create(email: "operator1@gmail.com", password: "password1", role_id: 2)
# User.create(email: "suryakant@gmail.com", password: "9673151454", role_id: 2)
# User.create(email: "achyut@gmail.com", password: "9607180726", role_id: 2)
# puts "Operator created successfully"

# Customers
# puts "Creating customer..."
User.create(email: "customer1@gmail.com", password: "password1", role_id: 3)
# User.create(email: "sachin@gmail.com", password: "12345678", role_id: 3)
# User.create(email: "akash@gmail.com", password: "12345678", role_id: 3)
# puts "Created customer successfully"