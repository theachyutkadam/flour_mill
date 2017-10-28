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
    respond_to do |format|
      if @exp.save
        format.html { redirect_to home_index_path, notice: 'Expense was successfully Inserted.' }
        format.json { render :show, status: :created, location: @operator }
      else
        format.html { render :new }
        format.json { render json: expenses_path.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit_exp
  	@exp = Expense.find(params[:expense_id])
  end

  def destroy_exp
  	puts "**********************"
  	@exp = Expense.find(params[:id])
  	@exp.destroy
  	puts "***************trrt*******"
  	redirect_to expenses_path
  end

end
