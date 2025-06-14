require "test_helper"

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    # Login the user
    post login_path, params: { email: @user.email, password: "nitin" }

    # Use the book that belongs to this user from fixtures
    @book = books(:one)
    @review = reviews(:one)
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
          comment: "Excellent book!",
          rating: 5
        }
      }
    end
    assert_redirected_to book_path(@book)
  end

  test "should get edit" do
    get edit_book_review_path(@book, @review)
    assert_response :success
  end

  test "should update review" do
    patch book_review_path(@book, @review), params: {
      review: {
        comment: "Updated comment",
        rating: 4
      }
    }
    assert_redirected_to book_path(@book)
    @review.reload
    assert_equal "Updated comment", @review.comment
    assert_equal 4, @review.rating
  end

  test "should destroy review" do
    assert_difference("Review.count", -1) do
      delete book_review_path(@book, @review)
    end
    assert_redirected_to book_path(@book)
  end

  test "should not create review with invalid data" do
    assert_no_difference("Review.count") do
      post book_reviews_path(@book), params: {
        review: {
          comment: "",
          rating: 6
        }
      }
    end
    assert_response :unprocessable_entity
  end

  test "should not update review with invalid data" do
    patch book_review_path(@book, @review), params: {
      review: {
        comment: "",
        rating: 0
      }
    }
    assert_response :unprocessable_entity
    @review.reload
    assert_not_equal "", @review.comment
  end
end
