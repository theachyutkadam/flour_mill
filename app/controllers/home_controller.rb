class HomeController < ApplicationController
  def index
    if current_user.admin?
      @customers = Customer.search(params)
      @operators = Operator.search(params)
    elsif current_user.customer?
      @products = Product.where(customer_id: current_user.customer.id).order(created_at: :desc)
      @payments = Payment.where(customer_id: current_user.customer.id).order(created_at: :desc)
    elsif current_user.operator?
      @customers = Customer.search(params)
    end
  end
end
