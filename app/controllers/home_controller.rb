class HomeController < ApplicationController
  def index
    if current_user.id == 1
    elsif current_user.id == 2
       @cust = Customer.where(id: current_user.customer.id)
       @products = Product.all
    end
  end
end
