class ReportsController < ApplicationController
  def index
    @customers = Customer.all
    @operators = Operator.all
    @products = Product.all
    @payments = Payment.all
    @expenses = Expense.all
  end

  def report_customers
    @customers = Customer.all
    @operators = Operator.all
    @products = Product.all
    @payments = Payment.all
  end
end
