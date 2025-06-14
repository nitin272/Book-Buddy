require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  def setup
    @book = books(:one)
    @review = reviews(:one)
  end

  test "should be valid" do
    assert @review.valid?
  end

  test "comment should be present" do
    @review.comment = "   "
    assert_not @review.valid?
  end

  test "rating should be present" do
    @review.rating = nil
    assert_not @review.valid?
  end

  test "rating should be between 1 and 5" do
    @review.rating = 0
    assert_not @review.valid?
    @review.rating = 6
    assert_not @review.valid?
    @review.rating = 5
    assert @review.valid?
  end

  test "should belong to a book" do
    @review.book = nil
    assert_not @review.valid?
  end

  test "should create a valid review" do
    review = Review.new(
      comment: "Great book!",
      rating: 4,
      book: @book
    )
    assert review.valid?
  end
end
