class ExpensesController < ApplicationController
  before_action:, only: [:edit_exp, :update_exp, :destroy_exp]
  def index
    @expenses = Expense.all
    @exp = Expense.new
  end

  def create_expense
    @exp = Expense.new(expense_params)
    if @exp.save
      flash[:notice] = 'Expense was successfully Created.'
      redirect_to expenses_path
    else
      @expenses = Expense.all
      flash[:alert] = 'Expense not Create.'
      render :index
    end
  end

  def edit_exp; end

  def update_exp
    if @exp.update(expense_params)
      flash[:notice] = 'Expense was successfully updated.'
      redirect_to expenses_path
    else
      flash[:alert] = 'Expense not updated.'
      render :edit
    end
  end

  def destroy_exp
    @exp.destroy
    redirect_to expenses_path
  end

  private
  def expense_params
    params.require(:expense).permit(:expense_type, :expence, :quantity, :description)
  end
  def find_expenses
    @exp = Expense.find(params[:id])
  end

end
