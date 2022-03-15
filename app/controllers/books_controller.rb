class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    if@book.valid?
      flash[:notice]="Book is Added!"
      redirect_to books_path
    else
      flash[:notice]="Book is not Added!"
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if@book.update(book_params)
      flash[:notice]="Book is Updated!"
      redirect_to books_path
    else
      flash[:notice]="Updation Operation Failed!"
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if@book.destroy
      flash[:notice]="Book is Deleted!"
      redirect_to books_path
    else
      flash[:notice]="Deletion Operation Failed!"
    end
  end

  private
  def book_params
    params.require(:book).permit(:name, :price, :author_id)
  end
end
