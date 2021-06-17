class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :set_new_customer, only: [:index, :new]
  before_action :authenticate_user!, except: [:google_auth_login]

  def index
    @customers = Customer.search(params).all.order(created_at: :asc)
  end

  def new; end

  def edit; end

  def create
    @customer = Customer.new(customer_params)
    @customers = Customer.all
    @customer.created_at = params[:customer][:created_at]
    if @customer.save
      flash[:notice] = 'Customer was successfully created'
      current_user.admin? ? (redirect_to new_product_path(cust_id: @customer.id)) : (redirect_to new_product_path(cust_id: @customer.id))
    else
      current_user.admin? ? (render :index) : (render :new)
    end
  end

  def update
    if @customer.update(customer_params)
      flash[:notice] = 'Customer was successfully updated.'
      redirect_to home_index_path
    else
      flash[:alert] = 'Customer not updated.'
      render :edit
    end
  end

  def destroy
    if(params[:customer][:password] == "password")
      @customer.destroy
      flash[:notice] = 'Customer was successfully destroyed.'
      redirect_to home_index_path
    else
      flash[:alert] = "Password is incorrect"
      redirect_to home_index_path
    end
  end

  def confirm_delete
    @customer = Customer.find(params[:cust_id])
  end

  def google_auth_login
    user = User.new
    user.email = mail = params[:email]
    user.password = '123456'
    user.role_id = Role.find_by_name("Customer").id
    if user.save
      sign_in :user, user
      @customer = Customer.create(user_id: user.id, mail: user.email)
      redirect_to edit_customer_path(@customer)
    else
      redirect_to home_index_path
    end
  end

  private
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def set_new_customer
      @customer = Customer.new
    end

    def customer_params
      params.require(:customer).permit(:first_name, :middle_name, :last_name, :address, :mobile_num, :mail, :family_members, :created_at)
    end
end
