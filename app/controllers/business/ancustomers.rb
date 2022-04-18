class Business:AncustomersController < ApplicationController
  #add callback
  before_action: set_ancustomer, only: [:preview, :edit, :update, :delete_customer]

  def index
    @ancustomers = Ancustomer.all
  end

  def new
    @ancustomer = Ancustomer.new
  end

  def create
    @ancustomer = Ancustomer.new(ancustomer_params)
    if @ancustomer.save
      flash[:notice] = "Customer's Records Created Successfully !"
      redirect_to preview_business_ancustomer_path(@ancustomer)
    else
      render new_business_ancustomers_path
    end
  end

  def edit
  end

  def update
    @ancustomer = Ancustomer.new(ancustomer_params)
    if @ancustomer.update
      flash[:notice] = "Customer's Records Created Successfully !"
      redirect_to preview_business_ancustomer_path(@ancustomer)
    else
      render edit_business_ancustomers_path
    end
  end

  def delete_customer
    @ancustomer.destroy
    redirect_to business_ancustomers_path
  end

  def search
    @ancustomer = Ancustomer.where('name LIKE ?', params[:search_name] + "%")
  end

  private
  def set_ancustomer
    @ancustomer = Ancustomer.find(params[:id])
  end

  def ancustomer_params
    params.require(:ancustomer).permit(:name, :email, :phone_number)
  end
end
