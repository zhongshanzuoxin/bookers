class BooksController < ApplicationController
  
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      flash.now[:notice] = "errors prohibited this book from being saved"
      render :index
    end 
  end 

  def index
    @books = Book.all
    @book = Book.new
  end
  
  def show
    @book = Book.find(params[:id])
  end 

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if
      @book.update(book_params)
      flash[:update] = "Book was successfully update"
      redirect_to book_path(@book.id)
    else
      flash.now[:notice] = "errors prohibited this book from being saved"
      render :edit
    end
  end 
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:success] = "Book was successfully destroyed"
    redirect_to '/books'
  end 
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
