class Customer < ActiveRecord::Base
	has_many :products
	belongs_to :user

	validates :first_name, presence: true
	validates :middle_name, presence: true
	validates :last_name, presence: true
  validates :address, presence: true
  validates :mobile_num, presence: true, length: { minimum: 10 }
  validates :mail, presence: true
end
