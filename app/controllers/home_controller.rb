class HomeController < ApplicationController
  def index

    if current_user.role.name == "Admin"
      if params[:search]
        @customers = Customer.where("first_name like ? OR last_name like ? OR mobile_num like ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
        @operators = Operator.where("first_name like ? OR last_name like ? OR mobile like ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
      else
        @customers = Customer.order(last_name: :asc)
        @operators = Operator.order(last_name: :asc)
      end
      # TODO Write a variable which only need for admin page.
    elsif current_user.role.name == "Customer"
      @products = Product.where(customer_id: current_user.customer.id).order(created_at: :desc)
      @payments = Payment.where(customer_id: current_user.customer.id).order(created_at: :desc)

    elsif current_user.role.name == "Operator"
      if params[:search]
        @customers = Customer.where("first_name like ? OR last_name like ? OR mobile_num like ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
      else
        @customers = Customer.order(last_name: :asc)
      end
      # TODO Write a variable which only need for operator page.
    end
  end
end