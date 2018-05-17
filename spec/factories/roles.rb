FactoryBot.define do
  factory :admin, class: Role do
    name "Admin"
  end

  factory :customer, class: Role do
    name "Customer"
  end

  factory :operator, class: Role do
    name "Operator"
  end
end
