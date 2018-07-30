class Product < ActiveRecord::Base
  belongs_to :customer
  belongs_to :operator
  belongs_to :item

  validates :product_name, presence: true
  validates :payment_type, presence: true
  validates :price, presence: true, numericality: true
  validates :weight, presence: true, numericality: true
  validates :operator_id, presence: true, numericality: true
end

