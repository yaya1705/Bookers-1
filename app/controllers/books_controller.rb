class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_paramas)
    if @book.save
      redirect_to book_path(@book.id), notice: "Book was successfully created."
    else
      @books = Book.all
      render :index
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_paramas)
      redirect_to book_path(@book.id), notice: "Book was successfully updated."
    else
      @book = Book.find(params[:id])
      render :edit
    end
  end

  private

  def book_paramas
    params.require(:book).permit(:title,:body)
  end
end
