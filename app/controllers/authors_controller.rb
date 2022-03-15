class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if@author.save
      flash[:notice]="Author is Added!"
      redirect_to authors_path
    else
      flash[:notice]="Author is not Added!"
      render edit
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if@author.update(author_params)
      flash[:notice]="Author is Updated!"
      redirect_to authors_path
    else
      flash[:notice]="Updation Operation Failed!"
      render edit
    end
  end

  def destroy
    @author = Author.find(params[:id])
    if@author.destroy
      flash[:notice]="Author is Deleted!"
      redirect_to authors_path
    else
      flash[:notice]="Deletion Operation Failed!"
    end
  end

  private
  def author_params
    params.require(:author).permit(:first_name, :last_name, :dob, :email)
  end
end
