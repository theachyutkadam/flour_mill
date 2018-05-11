class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customer = Customer.new
    if params[:search]
      @customers = Customer.where("first_name like ? OR last_name like ? OR mobile_num like ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @customers = Customer.order(last_name: :asc)
    end
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def edit
  end

  def create
    @user = User.new
    @user.email = params[:customer][:mail]
    @user.password = params[:customer][:mobile_num]
    @user.role_id = Role.find_by_name("Customer").id
    @user.email = "TODO@gmail.com"
    @user.save
    user_id = User.last.id
    @customer = Customer.new(customer_params)
    @customer.user_id = user_id
    @customers = Customer.all

    if @customer.save
      if @customer.mail.blank?
        @user.email = @customer.first_name + @customer.mobile_num.to_s.last(4)
        @customer.mail = @user.email
        @user.save
        @customer.save
      end
      flash[:notice] = 'Customer was successfully created'
      if current_user.role.name == "Admin"
        redirect_to customers_path
      elsif current_user.role.name == "Operator"
        redirect_to home_index_path
      end
    else
      if current_user.role.name == "Admin"
        render :index
      elsif current_user.role.name == "Operator"
        render :new
      end
    end

  end

  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to home_index_path, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if(params[:customer][:password] == "password")
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to home_index_path, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
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

    def customer_params
      params.require(:customer).permit(:first_name, :middle_name, :last_name, :address, :mobile_num, :mail, :family_members)
    end
end
