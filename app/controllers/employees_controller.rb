class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
    if params[:search]
      if Employee.find_by("email=?", params[:search])
        flash[:notice] = "Email is exists in this record!"
      else
        flash[:notice] = "Email does not exists in this record!"
      end
    end
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.find_or_create_by(employee_params)
    if @employee.valid?
      flash[:notice] = "Employee added successfully !"
      redirect_to employees_path
    else
      flash[:error] = "Oops, Employee cannot be added !"
      render :new
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      flash[:notice] = "Employee's records Updated Successfully !"
      redirect_to employees_path
    else
      flash[:error] = "Oops, Updation Operation Failed !"
      render :edit
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    if @employee.destroy
      flash[:notice] = "Employee's records Deleted Successfully !"
      redirect_to employees_path
    else
      flash[:error] = "Oops, Deletion Operation Failed !"
    end
  end

  def result
  end

  def increase_order
    employee = Employee.find_in_batches(batch_size:10)
    employee.first.each do |e|
      e.no_of_order+=1
      e.save
    end
    redirect_to employees_path
  end

  def decrease_order
    employee = Employee.find_in_batches(batch_size:10)
    employee.first.each do |e|
      e.no_of_order-=1
      e.save
    end
    redirect_to employees_path
  end

  private
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :age, :email, :no_of_order, :full_time_available, :salary)
    end
end
