class Item < ActiveRecord::Base
  # uniqueness: true, on: :create
  has_many :products
  validates :item_name, presence: true, uniqueness: true, on: :create, format: {with: /[a-z]/, message: 'Write only small letter'}
  validates :rate, presence: true, numericality: true
end
