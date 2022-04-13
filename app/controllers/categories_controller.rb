class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      flash[:notice] = "Category's details Added Successfully!"
      redirect_to categories_path
    else
      flash[:error] = "Category can't be added!"
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "category's records Updated Suceessfully!"
      redirect_to categories_path
    else
      flash[:error] = "Oops, Updation Operation Failed!"
      render :edit
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:notice] = "Category's records Deleted Successfully !"
      redirect_to categories_path
    else
      flash[:notice] = "Oops, Deletion Operation Failed !"
    end
  end

  private
    def category_params
      params.require(:category).permit(:category_name)
    end
end
