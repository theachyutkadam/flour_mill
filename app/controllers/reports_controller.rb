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
    @customers = Customer.all.order(last_name: :asc).search(params)
  end

  def date_vis_product
    @products = Product.all.order(created_at: :desc)
  end

  def customer_product
    created_at = params[:customer][:created_at]
    @created_at = params[:customer][:created_at]
    @products = Product.where("Date(created_at) =?", created_at)
  end
end
