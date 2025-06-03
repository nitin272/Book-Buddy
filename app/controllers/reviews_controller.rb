class ReviewsController < ApplicationController
  before_action :set_book
  before_action :set_review, only: [ :show, :edit, :update, :destroy ]

  def index
    @reviews = @book.reviews
  end

  def show
  @book = Book.find(params[:book_id])
  @review = @book.reviews.find(params[:id])
end

  def new
    @review = @book.reviews.build
  end

  def edit
  end

  def create
    @review = @book.reviews.new(review_params)
    if @review.save
      redirect_to dashboard_path(@book), notice: "Review created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @review.update(review_params)
      redirect_to dashboard_path(@book), notice: "Review updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    redirect_to dashboard_path(@book), notice: "Review deleted successfully."
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_review
    @review = @book.reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
