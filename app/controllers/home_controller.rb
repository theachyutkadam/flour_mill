class HomeController < ApplicationController
  def index
    if current_user.admin?
      @customers = Customer.search(params)
      @operators = Operator.search(params)
    elsif current_user.customer?
      @items = Item.all
      @products = Product.where(customer_id: current_user.customer.id).order(created_at: :desc)
      @payments = Payment.where(customer_id: current_user.customer.id).order(created_at: :desc)
    elsif current_user.operator?
      @customers = Customer.search(params)
    end
  end

  def show
    students = RestClient.get("http://localhost:4001/api/v1/students", :content_type => :json, :accept => :json)
    @api_students = JSON.parse(students)
binding.pry
    customers = RestClient.get("http://localhost:4001/api/v1/customers", :content_type => :json, :accept => :json)
    @api_customers = JSON.parse(customers)
  end

end
