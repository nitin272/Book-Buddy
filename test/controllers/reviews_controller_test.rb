require "test_helper"

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    @book = books(:one)
    @review = reviews(:one)

    # Login as user
    post login_path, params: { email: @user.email, password: "nitin" }
  end

  test "should get index" do
    get book_reviews_path(@book)
    assert_response :success
    assert_not_nil assigns(:reviews)
  end

  test "should get new" do
    get new_book_review_path(@book)
    assert_response :success
    assert_not_nil assigns(:review)
  end

  test "should create review" do
    assert_difference("Review.count") do
      post book_reviews_path(@book), params: {
        review: {
          rating: 5,
          comment: "Great book!"
        }
      }
    end
    assert_redirected_to book_path(@book)
    assert_equal "Review was successfully created.", flash[:notice]
  end

  test "should get edit" do
    get edit_book_review_path(@book, @review)
    assert_response :success
  end

  test "should update review" do
    patch book_review_path(@book, @review), params: {
      review: {
        rating: 4,
        comment: "Updated comment"
      }
    }
    assert_redirected_to book_path(@book)
    assert_equal "Review was successfully updated.", flash[:notice]
    @review.reload
    assert_equal 4, @review.rating
    assert_equal "Updated comment", @review.comment
  end

  test "should destroy review" do
    assert_difference("Review.count", -1) do
      delete book_review_path(@book, @review)
    end
    assert_redirected_to book_path(@book)
    assert_equal "Review was successfully deleted.", flash[:notice]
  end
end
