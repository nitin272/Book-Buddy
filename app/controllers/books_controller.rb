class BooksController < ApplicationController
  before_action :set_book, only: [ :show, :edit, :update, :destroy ]


  def index
    @books = current_user.books
  end


  def show
    @review = @book.reviews.new
  end


  def new
    @book = current_user.books.new
  end


  def create
    @book = current_user.books.new(book_params)
    if @book.save
      redirect_to dashboard_path, notice: "Book was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

def update
  if @book.update(book_params)
    redirect_to dashboard_path(@book), notice: "Book was successfully updated."
  else
    render :edit, status: :unprocessable_entity
  end
end

  def destroy
  @book.destroy
  redirect_to dashboard_path, notice: "Book was successfully deleted."
end


  private

  def set_book
    # Only find book among current_user's books for security
    @book = current_user.books.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :genre, :notes)
  end
end
