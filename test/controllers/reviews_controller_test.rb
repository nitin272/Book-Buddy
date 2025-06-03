require "test_helper"

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @book = books(:one)
    @review = reviews(:one)

    post login_path, params: { email: @user.email, password: "nitin" }

    assert_equal @user.id, session[:user_id]
  end

  test "should get index" do
    get book_reviews_url(@book)
    assert_response :success
  end

  test "should get new" do
    get new_book_review_url(@book)
    assert_response :success
  end

  test "should create review" do
    assert_difference("Review.count") do
      post book_reviews_url(@book), params: { review: { book_id: @book.id, comment: "Great!", rating: 5 } }
    end

    assert_redirected_to book_review_url(@book, Review.last)
  end

  test "should show review" do
    get book_review_url(@book, @review)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_review_url(@book, @review)
    assert_response :success
  end

  test "should update review" do
    patch book_review_url(@book, @review), params: { review: { comment: "Updated comment", rating: 4 } }
    assert_redirected_to book_review_url(@book, @review)
  end

  test "should destroy review" do
    assert_difference("Review.count", -1) do
      delete book_review_url(@book, @review)
    end

    assert_redirected_to book_reviews_url(@book)
  end
end