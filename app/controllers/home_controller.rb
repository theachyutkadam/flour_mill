class HomeController < ApplicationController
  def index
    if current_user.role.name == "Admin"
      # TODO Write a variable which only need for admin page.
    elsif current_user.role.name == "Customer"
      @products = Product.where(customer_id: current_user.customer.id)
    elsif current_user.role.name == "Operator"
      @products = Product.where(operator_id: current_user.operator.id)
      # TODO Write a variable which only need for operator page.
    end
  end
end
