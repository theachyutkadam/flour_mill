class Customer < ActiveRecord::Base
  has_many :products
  has_many :payments
  belongs_to :user

  validates :first_name, presence: true, format: {with: /[a-z]/, message: 'Write only small letter'}
  validates :last_name, presence: true, format: {with: /[a-z]/, message: 'Write only small letter'}
  validates :address, presence: true, format: {with: /[a-z0-9]/, message: 'Write only small letter'}
  validates :mail, :uniqueness => { scope: :user_id }, on: :create
  validates :mobile_num, numericality: true, :length => { minimum: 10 }, uniqueness: true, on: :create
end