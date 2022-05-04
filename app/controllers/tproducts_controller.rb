class TproductsController < ApplicationController
  #add callback
  before_action :set_tproduct, only: [:edit, :update, :show, :destory]

  def index
    @tproducts = Tproduct.all
  end

  def show
  end

  def new
    @tproduct = Tproduct.new
  end

  def create
    @tproduct = Tproduct.new(tproduct_params)
    if @tproduct.save
      flash[:notice] = "Product Details has been Added Successfully !"
      redirect_to tproducts_path
    else
      render :new
    end
  end

  def edit
    @tproduct = Tproduct.find_by(params[:id])
  end

  def update
    @tproduct = Tproduct.find(params[:id])
    if @tproduct.update(tproduct_params)
      flash[:notice] = "Product's Records has been Updated Successfully !"
      redirect_to tproducts_path
    else
      render :edit
    end
  end

  def destory
    @tproduct.destroy
    redirect_to tproducts_path
  end

  private

  def set_tproduct
    @tproduct = Tproduct.find_by(params[:id])
  end

  def tproduct_params
    params.require(:tproduct).permit(:product_name, :price, :description)
  end
end
