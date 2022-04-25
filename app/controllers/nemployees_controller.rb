class NemployeesController < ApplicationController
  #add callback
  before_action :set_nemployee, only: [:show, :edit, :update, :destroy]
  
  def index
    @nemployees = Nemployee.all
  end

  def new
    @nemployee = Nemployee.new
    @nemployee.naddresses.build
  end

  def create
    @nemployee = Nemployee.new(nemployee_params)
    if @nemployee.save
      flash[:notice] = "Employees Details has been Added Successfully !"
      redirect_to nemployees_path
    else
      render :new
    end
  end

  def edit
    @nemployee = Nemployee.find(params[:id])
  end

  def show
  end

  def update
    @nemployee = Nemployee.find(params[:id])
    if @nemployee.update(nemployee_params)
      flash[:notice] = "Employee's Records has been Updated Successfully !"
      redirect_to nemployees_path
    else
      render :edit
    end
  end

  def destroy
    @employee.destroy
    redirect_to nemployees_path
  end

  #define search method
  def search
    if params[:query]
      if params[:query] == ""
        flash[:alert] = "Please enter the name !!!"
        redirect_to search_path
      else
        @nemployees = Nemployee.where('employee_name LIKE ?', params[:query] + "%")
      end
    end
  end

  private
    def set_nemployee
      @nemployee = Nemployee.find(params[:id])
    end

    #define parameters
    def nemployee_params
      params.require(:nemployee).permit(:employee_name, :email, :password, :gender, :address, :mobile_number, :birth_date, :document, naddresses_attributes:[:id, :house_name, :street_name, :road] ,hobbies: [])
    end
end
