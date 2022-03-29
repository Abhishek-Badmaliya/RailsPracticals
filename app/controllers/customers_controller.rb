class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:notice] = "Customer Added Successfully!"
      redirect_to customers_path
    else
      flash[:error] = "Customer is not added!"
      render :new
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "Customer's records Updated Successfully !"
      redirect_to customers_path
    else
      flash[:notice] = "Oops, Updation Operation Failed !"
      render :edit
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    if @customer.destroy
      flash[:notice] = "Customer's records Deleted Successfully !"
      redirect_to customers_path
    else
      flash[:notice] = "Oops, Deletion Operation Failed !"
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:fname, :lname, :email, :phone_number)
  end
end
