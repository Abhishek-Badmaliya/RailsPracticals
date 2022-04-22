class NemployeesController < ApplicationController
  #add callback
  before_action :set_nemployee, only: [:show, :edit, :update, :destroy]
  
  def index
    @nemployees = Nemployee.all
  end

  def new
    @nemployee = Nemployee.new
  end

  def create
    @nemployee = Nemployee.new(nemployee_params)
    if @nemployee.save
      flash[:notice] = "Employees Details Added Successfully !"
      redirect_to nemployees_path
    else
      render :new
    end
  end

  def edit
    @nemployee = Nemployee.find(params[:id])
  end

  def show
    @nemployee = Nemployee.find(params[:id])
  end

  def update
    @nemployee = Nemployee.find(params[:id])
    if @employee.update(employee_params)
      flash[:notice] = "Employee's Records Updated Successfully !"
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
  end

  private
    def set_nemployee
      @nemployee = Nemployee.find(params[:id])
    end

    #define parameters
    def nemployee_params
      params.require(:nemployee).permit(:employee_name, :email, :password, :gender, :hobbies, :address, :mobile_number, :birth_date, :document)
    end
end
