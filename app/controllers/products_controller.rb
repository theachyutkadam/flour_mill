class ProductsController < ApplicationController

  before_action :set_product, only: [:edit, :update, :destroy]

  # GET /products/new
  def new
    @cust = Customer.find(params[:cust_id])
    @products = @cust.products
    @product = Product.new
    @payment = Payment.new
    @payments = @cust.payments
  end

  # GET /products/1/edit
  def edit
    @cust = Customer.find(params[:customer_id])
    @products = @cust.products
    @payments = @cust.payments
  end

  # POST /products
  # POST /products.json
  def create
    @cust = Customer.find(params[:product][:customer_id])
    @products = @cust.products
    @payments = Payment.all
    @product = Product.new(product_params)
    # puts @product.inspect
    # @product.price = 3 * params[:product][:weight].to_i
    @product.weight = params[:product][:price].to_i/3
    # @product.payment_type = params[:product][:payment_type]
    respond_to do |format|
      if @product.save
        format.html { redirect_to new_product_path(cust_id: @cust.id), notice: 'Product was successfully created.' }
        format.json { render :new, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      @product.weight = 3/params[:product][:price].to_i
      if @product.update(product_params)
        format.html { redirect_to new_product_path(cust_id: @product.customer_id), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    customer_id = @product.customer.id
    @product.destroy
    redirect_to products_path(cust_id: customer_id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:product_name, :price, :weight, :customer_id, :operator_id, :payment_type )
    end
end