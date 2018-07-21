class ProductsController < ApplicationController

  before_action :set_product, only: [:edit, :update, :destroy]

  # GET /products/new
  def new
    @cust = Customer.find(params[:cust_id])
    @product = Product.new
    @payment = Payment.new
    @payments = @cust.payments.order(created_at: :desc)
    @products = @cust.products.order(created_at: :desc)
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
    x = params[:product][:product_name]
    @product.price = Item.find(x).rate * params[:product][:weight].to_f
    @product.item_id = x
    @payment = Payment.new
    if @product.save
      flash[:notice] =  'Product was successfully created.'
      redirect_to new_product_path(cust_id: @cust.id)
    else
      render :new
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product.price = 3 * params[:product][:weight].to_f
    if @product.update(product_params)
      if current_user.role.name == "Operator"
        flash[:notice] = 'Product was successfully updated.'
        redirect_to enter_operator_product_operators_path(cust_id: @product.customer_id)
      elsif current_user.role.name == "Admin"
        flash[:notice] = 'Product was successfully updated.'
        redirect_to new_product_path(cust_id: @product.customer.id)
      else
        flash[:notice] = 'Product update failed.'
        render :new
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