FactoryBot.define do
  factory :customer do
  	first_name "ganesh"
  	middle_name "sitaram"
  	last_name "kale"
  	address "saykhindi"
  	mobile_num "9552273780"
  	mail "#{first_name}#{last_name}@gmail.com"
  	association user
  	family_member 5
  end	
end