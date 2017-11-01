class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @cust = Customer.find(params[:cust_id])
    @products = @cust.products
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @cust = Customer.find(params[:cust_id])
    @products = @cust.products
    @product = Product.new

  end

  # GET /products/1/edit
  def edit
    @cust = Customer.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @cust = Customer.find(params[:product][:cust_id])
    @product = Product.new(product_params)
    @product.price = 3 * params[:product][:weight].to_i
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
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
      @product.price = 3 * params[:product][:weight].to_i
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
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
      params.require(:product).permit(:product_name, :price, :weight, :customer_id, :operator_id)
    end
end
