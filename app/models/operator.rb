class Operator < ActiveRecord::Base
	has_many :products
  belongs_to :user

  validates :first_name, presence: true
  validates :middle_name, presence: true
  validates :last_name, presence: true
  validates :mobile, presence: true, length: { minimum: 10}
  validates :mail, presence: true
  validates :permanent_address, presence: true
  validates :salary , presence: true
end
