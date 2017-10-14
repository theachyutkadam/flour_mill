class HomeController < ApplicationController
  def index
    if current_user.role.name == "Admin"
      # TODO Write a variable which only need for admin page.
    elsif current_user.role.name == "Customer"
       @products = Product.all
    elsif current_user.role.name == "Operator"
      # TODO Write a variable which only need for operator page.
    end
  end
end
