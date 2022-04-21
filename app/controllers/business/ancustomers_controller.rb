class Business::AncustomersController < ApplicationController
  #add callback
  before_action :set_ancustomer, only: [:preview, :edit, :update, :delete_customer]

  #define index
  def index
    @ancustomers = Ancustomer.all
  end

  #define new method
  def new
    @ancustomer = Ancustomer.new
  end

  def create
    @ancustomer = Ancustomer.new(ancustomer_params)
    if @ancustomer.save
      flash[:notice] = "Customer's Records Created Successfully !"
      redirect_to business_ancustomers_path
    else
      render new_business_ancustomers_path
    end
  end

  def edit
  end

  #define update method
  def update
    @ancustomer = Ancustomer.find(params[:id])
    if @ancustomer.update(ancustomer_params)
      flash[:notice] = "Customer's Records Updated Successfully !"
      redirect_to business_ancustomers_path
    else
      render edit_business_ancustomers_path
    end
  end

  #define preview method for show details
  def preview
    @ancustomer = Ancustomer.find(params[:id])
  end

  #define method for destroy the record
  def delete_customer
    @ancustomer = Ancustomer.find(params[:id])
    @ancustomer.destroy
    redirect_to business_ancustomers_path
  end

  #define search method for search the records
  def search
    @ancustomers = Ancustomer.where('name LIKE ?', params[:search_name])
  end

  private
  def set_ancustomer
    @ancustomer = Ancustomer.find(params[:id])
  end

  def ancustomer_params
    params.require(:ancustomer).permit(:name, :email, :phone_number)
  end
end
