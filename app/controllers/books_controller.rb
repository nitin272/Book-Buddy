class BooksController < ApplicationController
  before_action :require_login
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authorize_book_owner, only: [:show, :edit, :update, :destroy]

  def index
    @books = current_user.books.order(created_at: :desc)
  end

  def show
    @review = @book.reviews.build
    @reviews = @book.reviews.includes(:user).order(created_at: :desc)
  end

  def new
    @book = current_user.books.build
  end

  def edit
  end

  def create
    @book = current_user.books.build(book_params)

    if @book.save
      redirect_to dashboard_path, notice: "Book was successfully added."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      redirect_to dashboard_path, notice: "Book was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
    redirect_to dashboard_path, notice: "Book was successfully removed."
  end

  private

  def set_book
    @book = Book.find_by(id: params[:id])
    unless @book
      render file: "public/404.html", status: :not_found
    end
  end

  def authorize_book_owner
    unless @book.user == current_user
      render file: "public/404.html", status: :not_found
      return
    end
  end

  def book_params
    params.require(:book).permit(:title, :author, :description, :cover_image)
  end
end
