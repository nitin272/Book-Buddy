class BooksController < ApplicationController
  before_action :set_book, only: [ :show, :edit, :update, :destroy ]

  # GET /books
  def index
    @books = current_user.books
  end

  # GET /books/:id
  def show
    # @book is set by set_book
  end

  # GET /books/new
  def new
    @book = current_user.books.new
  end

  # POST /books
  def create
    @book = current_user.books.new(book_params)
    if @book.save
      redirect_to books_path, notice: "Book was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /books/:id/edit
  def edit
    # @book is set by set_book
  end

  # PATCH/PUT /books/:id
  def update
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "Book was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /books/:id
  def destroy
    @book.destroy
    redirect_to books_path, notice: "Book was successfully deleted."
  end

  private

  def set_book
    # Only find book among current_user's books for security
    @book = current_user.books.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author)
  end
end
