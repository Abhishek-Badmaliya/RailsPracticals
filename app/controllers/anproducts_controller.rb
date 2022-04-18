class AnproductsController < ApplicationController

  before_action :set_anproduct, only: [:show, :edit, :update, :destroy]

  def index
    @anproducts = Anproduct.all
  end

  def new
    @anproduct = Anproduct.new
  end

  def create
    @anproduct = Anproduct.new(anproduct_params)
    if @anproduct.save
      flash[:notice] = "Products records Added  Successfully!"
      redirect_to anproducts_path
    else
      flash[:error] = "Product can not be added!"
      render :new
    end
  end

  def edit
    @anproduct = Anproduct.find(params[:id])
  end

  def show
    set_anproduct
  end

  def update
    @anproduct = Anproduct.find(params[:id])
    if @anproduct.update(anproduct_params)
      flash[:notice] = "Product's Records Updated Successfully !"
      redirect_to anproducts_path
    else
      flash[:notice] = "Oops, Updation Operation Failed !"
      render :edit
    end
  end

  def destroy
    @anproduct = Anproduct.find(params[:id])
    if @anproduct.destroy
      flash[:notice] = "Product's Records Deleted Successfully !"
      redirect_to anproducts_path
    else
      flash[:notice] = "Oops, Deletion Operation Failed !"
    end
  end

  private
  def set_anproduct
    @anproduct = Anproduct.find(params[:id])
  end

  def anproduct_params
    params.require(:anproduct).permit(:product_name, :product_description, :product_price)
  end
  
end
