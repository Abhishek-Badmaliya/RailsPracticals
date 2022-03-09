class ProductsController < ApplicationController
  def index
    @products=Product.all
  end

  def show
    @product=Product.find(params[:id])
  end

  def new
    @product=Product.new
  end

  def create
    @product=Product.new(product_params)
    if@product.save
      flash[:notice]="Product Added Successfully!"
      redirect_to products_path
    else
      flash[:error]="Product is not added!"
      render :new
    end
  end

  def edit
    @product=Product.find(params[:id])
  end

  def update
    @product=Product.find(params[:id])
    if@product.update(product_params)
      flash[:notice]="Product Updated Suceessfully!"
      redirect_to products_path
    else
      flash[:error]="Updation Operation Failed!"
      render :edit
    end
  end

  def destroy
    @product=Product.find(params[:id])
    if@product.destroy
      flash[:notice]="Product is Deleted!"
      redirect_to products_path
    else
      flash[:error]="Deletion Operation Failed!"
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :old_price, :short_description, :full_description)
  end
end
