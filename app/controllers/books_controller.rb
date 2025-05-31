class BooksController < ApplicationController
  before_action :set_user
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /users/:user_id/books
  def index
    @books = @user.books.all
  end

  # GET /users/:user_id/books/:id
  def show
    # @book is already set by before_action
  end

  # GET /users/:user_id/books/new
  def new
    @book = @user.books.new
  end

  # POST /users/:user_id/books
  def create
    @book = @user.books.new(book_params)
    if @book.save
      redirect_to user_books_path(@user), notice: "Book was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /users/:user_id/books/:id/edit
  def edit
    # @book is already set by before_action
  end

  # PATCH/PUT /users/:user_id/books/:id
  def update
    if @book.update(book_params)
      redirect_to user_book_path(@user, @book), notice: "Book was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /users/:user_id/books/:id
  def destroy
    @book.destroy
    redirect_to user_books_path(@user), notice: "Book was successfully deleted."
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_book
    @book = @user.books.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author)
  end
end