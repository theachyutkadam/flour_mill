class Payment < ActiveRecord::Base
  belongs_to :customer

  validates :payment_ammount, presence: true, numericality: true
  validates :receiver, presence: true, format: {with: /[a-z0-9]/, message: 'Write only small letter'}
  validates :giver, presence: true, format: {with: /[a-z0-9]/, message: 'Write only small letter'}
  before_update :assign_attribute
  
  def last_payment_ammount
    self.customer.payments.sum(:payment_ammount) - self.customer.payments.last.payment_ammount
  end
  def generate_previous_ammount
    Product.where(customer_id: self.customer_id, payment_type: "borrow").sum(:price) - self.customer.payments.sum(:payment_ammount) - last_payment_ammount
  end

  def generate_left_ammount
    generate_previous_ammount - payment_ammount.to_f
  end

  def assign_attribute
    self.previous_ammount = generate_previous_ammount
    self.left_ammount = generate_left_ammount
  end
end
