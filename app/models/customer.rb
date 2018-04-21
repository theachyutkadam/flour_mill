class Customer < ActiveRecord::Base
	has_many :products
	has_many :payments
	belongs_to :user

	validates :first_name, presence: true
	validates :last_name, presence: true
  validates :address, presence: true
end
