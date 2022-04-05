class OrdersController < ApplicationController
  def index
    if params[:search]
      @orders = Order.all
      @orders = Order.where(order_status:'booked') if params[:search] == 'booked'
      @orders = Order.where(order_status:'cancelled') if params[:search] == 'cancelled'
    else
      @orders = Order.all
    end

    #Searching Orders Record by Product name
    begin
      if !(params[:product_name].blank?)
          @orders_by_product = Product1.where(["title LIKE ?","%#{params[:product_name]}%"])[0].orders
      end    
      rescue Exception
        flash[:notice] = "Record not found!"
        redirect_to orders_path
      end
    end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      flash[:notice] = "Order Added Successfully!"
      redirect_to orders_path
    else
      flash[:error] = "Order is not added!"
      render :new
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "Order's records Updated Successfully !"
      redirect_to orders_path
    else
      flash[:notice] = "Oops, Updation Operation Failed !"
      render :edit
    end
  end

  def destroy
    @order = Order.find(params[:id])
    if @order.destroy
      flash[:notice] = "Order's records Deleted Successfully !"
      redirect_to orders_path
    else
      flash[:notice] = "Oops, Deletion Operation Failed !"
    end
  end

  private
  def order_params
    params.require(:order).permit(:quantity, :total_price, :product1_id, :order_status, :customer_id)
  end
end
