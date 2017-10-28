class Product < ActiveRecord::Base
  belongs_to :customer
  belongs_to :operator

  validates :product_name, presence: true
  validates :price, presence: true
  validates :weight, presence: true
  validates :operator_id, presence: true
end

