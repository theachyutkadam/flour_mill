class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  # GET /payments
  # GET /payments.json
  def index
    @customer = Customer.find(params[:cust_id])
    @payments = @customer.payments
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @customer = Customer.find(params[:cust_id])
    @payments = @customer.payments
    @payment = Payment.new
    @products = @customer.products
  end

  # GET /payments/1/edit
  def edit
    @customer = Customer.find(params[:cust_id])
    @payments = @customer.payments
  end

  # POST /payments
  # POST /payments.json
  def create
    @customer = Customer.find(params[:payment][:customer_id])
    @payment = Payment.new(payment_params)
    @payment.previous_ammount.to_f = Product.where(customer_id: @customer, payment_type: "borrow").sum(:price).to_f - @customer.payments.sum(:payment_ammount).to_f
    @payment.left_ammount.to_f = @payment.previous_ammount - params[:payment][:payment_ammount].to_f

    if @payment.save
      redirect_to new_product_path(cust_id: @payment.customer.id)
    else
      render :new
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    if @payment.update(payment_params)
      redirect_to new_product_path(cust_id: @payment.customer.id)
    else
      render :edit
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:customer_id, :payment_ammount, :receiver, :giver, :previous_ammount, :left_ammount)
    end
end