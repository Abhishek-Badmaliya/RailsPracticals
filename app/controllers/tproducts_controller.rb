class TproductsController < ApplicationController
  #add callback
  before_action :set_tproduct, only: [:edit, :update, :show, :destory]
  before_action :authenticate_nuser!

  def index
    @tproducts = Tproduct.all
  end

  def show
    @tproduct = Tproduct.find(params[:id])
  end

  def new
    @tproduct = Tproduct.new
  end

  def create
    @tproduct = Tproduct.new(tproduct_params)
    if @tproduct.nuser = current_nuser
      if @tproduct.save
        flash[:notice] = "Product Details has been Added Successfully !"
        redirect_to tproducts_path
      else
        render :new
      end
    end
  end

  def edit
    @tproduct = Tproduct.find(params[:id])
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

  def destroy
    @tproduct = Tproduct.find(params[:id])
    @tproduct.destroy
    redirect_to tproducts_path
  end

  private
    def set_tproduct
      @tproduct = Tproduct.find(params[:id])
    end

    def tproduct_params
      params.require(:tproduct).permit(:product_name, :price, :description, :nuser_id)
    end
end
