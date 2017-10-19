class Product < ActiveRecord::Base
  belongs_to :customer
  belongs_to :operator

  validates :name, presence: true
  validates :price, presence: true
  validates :weight, presence: true
end