class AnordersController < ApplicationController
  #add callbacks
  before_action :set_anproduct
  before_action :set_anorder, only: [:show, :edit, :update, :destroy]

  def index
    @anorders = Anorder.all
  end

  def new
    @anorder = Anorder.new
  end

  def create
    @anorder = Anorder.new(anorder_params)
    if @anorder.save
      flash[:notice] = "Order's Records Added Successfully!"
      redirect_to anproduct_path(@anproduct)
    else
      flash[:error] = "Order's Records can not be Added!"
      render :new
    end
  end

  def edit
    @anorder = Anorder.find(params[:id])
  end

  def show
    @anorder = Anorder.find(params[:id])
  end

  def update
    @anproduct = Anproduct.find(params[:anproduct_id])
    @anorder = Anorder.find(params[:id])
    if @anorder.update(anorder_params)
      flash[:notice] = "Order's records Updated Successfully !"
      redirect_to anproduct_path(@anproduct)
    else
      flash[:notice] = "Oops, Updation Operation Failed !"
      render :edit
    end
  end

  def destroy
    @anorder = Anorder.find(params[:id])
    if @anorder.destroy
      flash[:notice] = "Order's records Deleted Successfully !"
      redirect_to anproduct_path(@anorder.anproduct)
    else
      flash[:notice] = "Oops, Deletion Operation Failed !"
    end
  end

  private
  def set_anproduct
    @anproduct = Anproduct.find(params[:anproduct_id])
  end

  def set_anorder
    @anorder = Anorder.find(params[:id])
  end

  def anorder_params
    params.require(:anorder).permit(:quantity, :total_price, :anproduct_id)
  end
end
