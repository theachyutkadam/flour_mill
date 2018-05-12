class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :set_new_customer, only: [:index, :new]

  def index
    @customer = Customer.new
    @customers = if params[:search]
                  Customer.where("first_name like ? OR last_name like ? OR mobile_num like ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
                else
                  Customer.order(last_name: :asc)
                end
  end

  def new
    @customer = Customer.new
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)
    @customers = Customer.all

    if @customer.save
      flash[:notice] = 'Customer was successfully created'
      current_user.admin? ? (redirect_to customers_path) : (redirect_to home_index_path)
    else
      current_user.admin? ? (render :index) : (render :new)
    end
  end

  def update
    if @customer.update(customer_params)
      flash[:notice] = 'Customer was successfully updated.'
      redirect_to home_index_path
    else
      render :edit
    end
  end

  def destroy
    if(params[:customer][:password] == "password")
      @customer.destroy
      flash[notice:] = 'Customer was successfully destroyed.'
      redirect_to home_index_path
    else
      flash[:notice] = "Password is incorrect"
      redirect_to home_index_path
    end
  end

  def confirm_delete
    @customer = Customer.find(params[:cust_id])
  end

  private
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def set_new_customer
      @customer = Customer.new
    end

    def customer_params
      params.require(:customer).permit(:first_name, :middle_name, :last_name, :address, :mobile_num, :mail, :family_members)
    end
end
