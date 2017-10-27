class ExpensesController < ApplicationController
  def index
    @exp = Expense.all
  end
  
  def create_expense
    puts "*/*/**"
    form = params[:expenditure]
    @exp = Expense.new
   
    @exp.expence_type = form[:expense_type]
    @exp.expence = form[:expense]
    @exp.save
    redirect_to expenses_path
  end

  def delete
  	
  end

end
