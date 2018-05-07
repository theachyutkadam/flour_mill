class Payment < ActiveRecord::Base
	belongs_to :customer

	validates :payment_ammount, presence: true, numericality: true
	validates :receiver, presence: true, format: {with: /[a-z0-9]/, message: 'Write only small letter'}
	validates :giver, presence: true, format: {with: /[a-z0-9]/, message: 'Write only small letter'}
end
