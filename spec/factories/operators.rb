  FactoryBot.define do
    factory :operator do
      first_name "surya"
      middle_name "dilip"
      last_name "kadam"
      mobile "1234567890"
      permanent_address "saykhind"
      mail "#{first_name}#{last_name}@gmail.com"
      salary 5000
      association user
    end
  end