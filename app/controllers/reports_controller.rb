class ReportsController < ApplicationController
  def index
    @customers = Customer.all
    @operators = Operator.all
    @products = Product.all
    @payments = Payment.all
    @expenses = Expense.all
    @items = Item.all
  end

  def report_customers
    @customers = Customer.all
    @operators = Operator.all
    @products = Product.all
    @payments = Payment.all
  end

  def date_vis_product
    @customers = Customer.all.order(created_at: :desc)
    @operators = Operator.all.order(created_at: :desc)
    @products = Product.all.order(created_at: :desc)
    @payments = Payment.all.order(created_at: :desc)
  end
end
