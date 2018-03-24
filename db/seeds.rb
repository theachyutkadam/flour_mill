# Role Records
Role.find_or_create_by(name: "Admin")
Role.find_or_create_by(name: "Operator")
Role.find_or_create_by(name: "Customer")

# Admin User
User.create(email: "admin@gmail.com", password: "12345678", role_id: 1)

# Operator Users
User.create(email: "ravikiran@gmail.com", password: "12345678", role_id: 2)
User.create(email: "suryakant@gmail.com", password: "12345678", role_id: 2)
User.create(email: "achyut@gmail.com", password: "12345678", role_id: 2)

# Customers
User.create(email: "ganesh@gmail.com", password: "12345678", role_id: 3)
User.create(email: "sachin@gmail.com", password: "12345678", role_id: 3)
User.create(email: "akash@gmail.com", password: "12345678", role_id: 3)
