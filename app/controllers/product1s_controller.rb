class Product1sController < ApplicationController
  def index
    @product1s = Product1.all
  end
    
  def show
    @product1 = Product1.find(params[:id])
  end
    
  def new
    @product1 = Product1.new
  end
    
  def create
    @product1 = Product1.new(product1_params)
    if @product1.save
      flash[:notice] = "Product Added Successfully!"
      redirect_to product1s_path
    else
      flash[:error] = "Product is not added!"
      render :new
    end
  end
    
  def edit
    @product1 = Product1.find(params[:id])
  end
    
  def update
    @product1 = Product1.find(params[:id])
    if @product1.update(product1_params)
      flash[:notice] = "Product's records Updated Successfully !"
      redirect_to product1s_path
    else
      flash[:notice] = "Oops, Updation Operation Failed !"
      render :edit
    end
  end
    
  def destroy
    @product1 = Product1.find(params[:id])
    if @product1.destroy
      flash[:notice] = "Product's records Deleted Successfully !"
      redirect_to product1s_path
    else
      flash[:notice] = "Oops, Deletion Operation Failed !"
    end
  end

  #create method for display all products on this page
  def display_all_products
    @product1s = Product1.all.unscoped
  end

  #create method for diaplay only active products
  def display_active_products
    @product1s = Product1.all
  end

  private
    def product1_params
      params.require(:product1).permit(:title, :description, :price, :capacity, :is_active, :status)
    end 
end
