class Expense < ActiveRecord::Base
	validates :expence_type, presence: true, format: {with: /[a-z]/, message: 'Write only small letter'}
	validates :expence, presence: true, numericality: true
	validates :quantity, presence: true
	validates :description, presence: true
end
