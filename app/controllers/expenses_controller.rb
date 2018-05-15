class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
    @exp = Expense.new
  end

  def create_expense
    form = params[:expenditure]
    @exp = Expense.new

    @exp.expence_type = form[:expense_type]
    @exp.expence = form[:expense].to_f
    @exp.quantity = form[:quantity]
    @exp.quantity = form[:description]
    if @exp.save
      flash[:notice] = 'Expense was successfully Created.'
      redirect_to expenses_path
    else
      @expenses = Expense.all
      # @exp.errors.messages
      flash[:alert] = 'Expense not Create.'
      render :index
    end
  end

  def edit_exp
    @exp = Expense.find(params[:id])
  end

  def destroy_exp
    @exp = Expense.find(params[:id])
    @exp.destroy
    redirect_to expenses_path
  end

  def update_exp
    form = params[:edit_exp]
    @exp = Expense.find(form[:id])
    @exp.expence_type = form[:expense_type]
    @exp.expence = form[:expense]
    @exp.quantity = form[:quantity]
    if @exp.save
      flash[:notice] = 'Expense was successfully updated.'
      redirect_to expenses_path
    else
      flash[:alert] = 'Expense not updated.'
      render :edit
    end
  end

  private
  def expense_params
    params.require(:expense).permit(:expense_type, :expence, :quantity, :description)
  end

end
