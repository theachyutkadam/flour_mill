class OperatorsController < ApplicationController
  before_action :set_operator, only: [:show, :edit, :update, :destroy]

  # GET /operators
  # GET /operators.json  
  def index
    @operator = Operator.new
    @operators = Operator.all
  end

  def show_operator_product
    @products = Product.where(customer_id: params[:cust_id], operator_id: current_user.operator.id)
  end

  def enter_operator_product
    @product = Product.new
    @customer = Customer.find(params[:cust_id])
  end

  def create_product
    @product = Product.new
    product_params = params[:enter_operator_product]
    @product.operator_id = product_params[:operator_id]
    @product.customer_id = product_params[:customer_id]
    @product.weight = product_params[:weight]
    @product.product_name = product_params[:product_name]
    @customer = Customer.find(product_params[:customer_id])
    # @product.price = @product.weight * 3
    if @product.save
      redirect_to show_operator_product_operators_path(cust_id: @product.customer_id)
    else
      # redirect_to enter_operator_product_operators_path(cust_id: product.customer_id)
      render :enter_operator_product
    end
  end
  # GET /operators/1
  # GET /operators/1.json
  def show
    @products = Product.where(operator_id: params[:id])
  end

  def record
    @products = Operator.find(params[:operator_id]).products
  end

  # GET /operators/new
  def new
    @operator = Operator.new
  end

  # GET /operators/1/edit
  def edit
  end

  # POST /operators
  # POST /operators.json
  def create
    @user = User.new
    @user.email = params[:operator][:mail]
    @user.password = params[:operator][:mobile]
    @user.role_id = Role.find_by_name("Operator").id
    @user.save
    user_id = User.last.id
    @operator = Operator.new(operator_params)
    @operator.user_id = user_id
    respond_to do |format|
      if @operator.save
        format.html { redirect_to home_index_path, notice: 'Operator was successfully created.' }
        format.json { render :show, status: :created, location: @operator }
      else
        format.html { render :new }
        format.json { render json: @operator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operators/1
  # PATCH/PUT /operators/1.json
  def update
    respond_to do |format|
      if @operator.update(operator_params)
        format.html { redirect_to home_index_path, notice: 'Operator was successfully updated.' }
        format.json { render :show, status: :ok, location: @operator }
      else
        format.html { render :edit }
        format.json { render json: @operator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operators/1
  # DELETE /operators/1.json
  def destroy
    if(params[:operator][:password] == "password")
      @operator.destroy
      respond_to do |format|
        format.html { redirect_to home_index_path, notice: 'Operator was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      flash[:notice] = "Password incorrect"
      redirect_to home_index_path
    end
  end

  def confirm_delete
    @operator = Operator.find(params[:operator_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operator
      @operator = Operator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def operator_params
      params.require(:operator).permit(:first_name, :middle_name, :last_name, :mobile, :mail, :permanent_address, :salary)
    end
end