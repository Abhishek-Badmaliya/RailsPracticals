class StudentsController < ApplicationController
  def index
    @students=Student.all
  end

  def show
    @student=Student.find(params[:id])
  end

  def new
    @student=Student.new
  end

  def create
    @student=Student.new(student_params)
    if@student.save
      flash[:notice]="Student Added Successfully!"
      redirect_to students_path
    else
      flash[:error]="Student is not added!"
      render :new
    end
  end

  def edit
    @student=Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if@student.update(student_params)
      flash[:notice]="Student's records Updated!"
      redirect_to students_path
    else
      flash[:notice]="Updation Operation Failed!"
      render :edit
    end
  end

  def destroy
    @student = Student.find(params[:id])
    if@student.destroy
      flash[:notice]="Student's records Deleted!"
      redirect_to students_path
    else
      flash[:notice]="Deletion Operation Failed!"
    end
  end

  private
  def student_params
    params.require(:student).permit(:first_name, :last_name, :stu_dob, :dept, :terms_of_usage)
  end
end
