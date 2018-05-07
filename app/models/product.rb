class Product < ActiveRecord::Base

  belongs_to :customer
  belongs_to :operator

  validates :product_name, presence: true, format: {with: /[a-z]/, message: 'Write only small letter'}
  validates :price, presence: true, numericality: true
  validates :weight, presence: true, numericality: true
  validates :operator_id, presence: true, numericality: true
end

