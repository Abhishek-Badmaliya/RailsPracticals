class FacultiesController < ApplicationController
  def index
    @faculties=Faculty.all
  end

  def show
    @faculty=Faculty.find(params[:id])
  end

  def new
    @faculty=Faculty.new
  end

  def create
    @faculty=Faculty.new(faculty_params)
    if@faculty.save
      flash[:notice]="Faculty Added Successfully!"
      redirect_to faculties_path
    else
      flash[:error]="Faculty is not added!"
      render :new
    end
  end

  def edit
    @faculty=Faculty.find(params[:id])
  end

  def update
    @faculty = Faculty.find(params[:id])
    if@faculty.update(faculty_params)
      flash[:notice]="Faculty's records Updated!"
      redirect_to faculties_path
    else
      flash[:notice]="Updation Operation Failed!"
      render :edit
    end
  end

  def destroy
    @faculty = Faculty.find(params[:id])
    if@faculty.destroy
      flash[:notice]="Faculty's records Deleted!"
      redirect_to faculties_path
    else
      flash[:notice]="Deletion Operation Failed!"
    end
  end

  private
  def faculty_params
    params.require(:faculty).permit(:first_name, :last_name, :contact, :email, :fac_dob, :desig)
  end
end
