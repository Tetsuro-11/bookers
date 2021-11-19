class BooksController < ApplicationController
  add_flash_types :info, :error, :warning
  
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book), notice: "Book was successfully created."
    else
      flash.alert = "error"
      redirect_to books_path
    end
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      redirect_to book_path(book), notice: "Book was successfully created."
    else
      redirect_to edit_book_path(book), alert: "error!!!"
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to blogs_path
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
