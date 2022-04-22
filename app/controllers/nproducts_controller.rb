class NproductsController < ApplicationController
  #add callbacks mwthods
  before_action :set_nproduct, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, except: [:index, :show]

  def index
    @nproducts = Nproduct.all
  end

  def new
    @nproduct = Nproduct.new
  end

  def create
    @nproduct = Nproduct.new(nproduct_params)
    if @nproduct.save
      flash[:notice] = "Products records Added  Successfully!"
      redirect_to nproducts_path
    else
      flash[:error] = "Product can not be added!"
      render :new
    end
  end

  def edit
    @nproduct = Nproduct.find(params[:id])
  end

  def show
    set_nproduct
  end

  def update
    @nproduct = Nproduct.find(params[:id])
    if @nproduct.update(nproduct_params)
      flash[:notice] = "Product's Records Updated Successfully !"
      redirect_to nproducts_path
    else
      flash[:notice] = "Oops, Updation Operation Failed !"
      render :edit
    end
  end

  def destroy
    @nproduct = Nproduct.find(params[:id])
    if @nproduct.destroy
      flash[:notice] = "Product's Records Deleted Successfully !"
      redirect_to nproducts_path
    else
      flash[:notice] = "Oops, Deletion Operation Failed !"
    end
  end

  #use private
  private
  def set_nproduct
    @nproduct = Nproduct.find(params[:id])
  end

  #define method for perform the actions
  def require_admin
    if current_nuser.role != "admin"
      flash[:alert] = "Requires login to perform that particular action !"
    end
  end

  def nproduct_params
    params.require(:nproduct).permit(:name, :description, :price)
  end 
end
