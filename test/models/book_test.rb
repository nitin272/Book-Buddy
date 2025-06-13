require "test_helper"

class BookTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @book = books(:one)
  end

  test "should be valid" do
    assert @book.valid?
  end

  test "title should be present" do
    @book.title = "   "
    assert_not @book.valid?
  end

  test "author should be present" do
    @book.author = "   "
    assert_not @book.valid?
  end

  test "should belong to a user" do
    @book.user = nil
    assert_not @book.valid?
  end

  test "should create a valid book" do
    book = Book.new(
      title: "New Book",
      author: "New Author",
      user: @user
    )
    assert book.valid?
  end

  # test "the truth" do
  #   assert true
  # end
end
