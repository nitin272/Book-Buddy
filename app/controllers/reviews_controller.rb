class ReviewsController < ApplicationController
  # before_action :authenticate_user!
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
  @review = @book.reviews.build(review_params)


  if @review.save
    redirect_to book_review_path(@book, @review), notice: "Review was successfully created."
  else
    render :new
  end
end

def update
  if @review.update(review_params)
    redirect_to book_review_path(@book, @review), notice: "Review was successfully updated."
  else
    render :edit
  end
end

def destroy
  @review.destroy
  redirect_to book_reviews_path(@book), notice: "Review was successfully destroyed."
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