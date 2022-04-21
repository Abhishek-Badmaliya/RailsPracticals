class NordersController < ApplicationController
  #add callbacks
  before_action :set_norder, only: [:show, :edit, :update, :destroy]

  def index
    @norders = Norder.all
  end

  def new
    @norder = Norder.new
  end

  def create
    @norder = Norder.new(norder_params)
    if @norder.save
      flash[:notice] = "Order's Records Added Successfully!"
      redirect_to norders_path
    else
      flash[:error] = "Order's Records can not be Added!"
      render :new
    end
  end

  def edit
    @norder = Norder.find(params[:id])
  end

  def show
    @norder = Norder.find(params[:id])
  end

  def update
    @norder = Norder.find(params[:id])
    if @norder.update(norder_params)
      flash[:notice] = "Order's records Updated Successfully !"
      redirect_to norders_path
    else
      flash[:notice] = "Oops, Updation Operation Failed !"
      render :edit
    end
  end

  def destroy
    @norder = Norder.find(params[:id])
    if @norder.destroy
      flash[:notice] = "Order's records Deleted Successfully !"
      redirect_to norders_path
    else
      flash[:notice] = "Oops, Deletion Operation Failed !"
    end
  end

  #use private
  private
  def set_norder
    @norder = Norder.find(params[:id])
  end

  def norder_params
    params.require(:norder).permit(:quantity, :total_price, :nproduct_id)
  end 
end
