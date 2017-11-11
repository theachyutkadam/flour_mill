class Expense < ActiveRecord::Base
	validates :expence_type, presence: true
	validates :expence, presence: true
end
