class Product < ActiveRecord::Base
  belongs_to :customer
  belongs_to :operator
end
