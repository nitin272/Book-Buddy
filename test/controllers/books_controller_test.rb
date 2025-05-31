class BooksControllerTest < ActionDispatch::IntegrationTest


  setup do
    @user = users(:one)
    @book = books(:one)
  end

  test "should get index" do
    get user_books_url(@user)
    assert_response :success
  end

  test "should get show" do
    get user_book_url(@user, @book)
    assert_response :success
  end

  test "should get new" do
    get new_user_book_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_book_url(@user, @book)
    assert_response :success
  end
end
