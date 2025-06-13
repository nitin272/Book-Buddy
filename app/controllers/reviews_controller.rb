class ReviewsController < ApplicationController
  before_action :require_login
  before_action :set_book
  before_action :set_review, only: [ :edit, :update, :destroy ]

  def index
    @reviews = @book.reviews.order(created_at: :desc)
  end

  def show
    @review = @book.reviews.find_by(id: params[:id])
    unless @review
      redirect_to @book, alert: "Review not found."
    end
  end

  def new
    @review = @book.reviews.build
  end

  def edit
  end

  def create
    @review = @book.reviews.build(review_params)

    if @review.save
      redirect_to @book, notice: "Review was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @review.update(review_params)
      redirect_to @book, notice: "Review was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    redirect_to @book, notice: "Review was successfully deleted."
  end

  private

  def set_book
    @book = Book.find_by(id: params[:book_id])
    unless @book
      redirect_to books_path, alert: "Book not found."
    end
  end

  def set_review
    @review = @book.reviews.find_by(id: params[:id])
    unless @review
      redirect_to @book, alert: "Review not found."
    end
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
