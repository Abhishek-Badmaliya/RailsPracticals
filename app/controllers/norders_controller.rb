class NordersController < ApplicationController
  #add callbacks method
  before_action :set_norder, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, except: [:index, :show]
  before_action :authenticate_nuser!

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

  #define method for perform the actions
  def require_admin
    if current_nuser.role != "admin"
      flash[:alert] = "Requires login to perform that particular action !"
    end
  end

  def norder_params
    params.require(:norder).permit(:quantity, :total_price, :nproduct_id)
  end 
end
