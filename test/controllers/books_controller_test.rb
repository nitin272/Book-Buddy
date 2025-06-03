require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    # Login the user
    post login_path, params: { email: @user.email, password: "nitin" }

    # Use the book that belongs to this user from fixtures
    @book = books(:one)
  end

  test "should get index" do
    get books_path
    assert_response :success
    assert_not_nil assigns(:books)
  end

  test "should get new" do
    get new_book_path
    assert_response :success
    assert_not_nil assigns(:book)
  end

  test "should get edit" do
    get edit_book_path(@book)
    assert_response :success
  end

  test "should show book" do
    get book_path(@book)
    assert_response :success
  end

  test "should create book" do
    assert_difference("Book.count") do
      post books_path, params: { book: { title: "New Book", author: "New Author" } }
    end
    assert_redirected_to dashboard_path
  end

  test "should update book" do
    patch book_path(@book), params: { book: { title: "Updated Title" } }
    assert_redirected_to dashboard_path(@book)
    @book.reload
    assert_equal "Updated Title", @book.title
  end

  test "should destroy book" do
    assert_difference("Book.count", -1) do
      delete book_path(@book)
    end
    assert_redirected_to dashboard_path
  end

  test "should not show other users books" do
  login_as(users(:one))
  get book_url(books(:two)) # book owned by users(:two), not users(:one)
  assert_response :missing # or expect a RecordNotFound
end
end
