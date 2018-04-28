class Payment < ActiveRecord::Base
	belongs_to :customer

	validates :payment_ammount, presence: true
	validates :receiver, presence: true
	validates :giver, presence: true
end
