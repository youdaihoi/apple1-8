class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice1] = "Book was successfully created"
      redirect_to book_path(@book.id)
    else
      @books = Book.all

      render :index


    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice1] = "Book was successfully created"
      redirect_to book_path(@book.id)
    else
      flash[:alert] = "error"
      redirect_to edit_book_path(@book.id)
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice2] = "Book was successfully destroyed"
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
