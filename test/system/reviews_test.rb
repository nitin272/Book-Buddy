require "application_system_test_case"

class ReviewsTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)       # Make sure you have a fixture for books
    @review = reviews(:one)   # And that this review belongs to books(:one)
  end

  test "visiting the index" do
    visit book_reviews_url(@book)
    assert_selector "h1", text: "Reviews"
  end

  test "should create review" do
    visit book_reviews_url(@book)
    click_on "New review"

    fill_in "Comment", with: "Excellent book!"
    fill_in "Rating", with: 5
    click_on "Create Review"

    assert_text "Review was successfully created"
    click_on "Back"
  end

  test "should update Review" do
    visit book_review_url(@book, @review)
    click_on "Edit this review", match: :first

    fill_in "Comment", with: "Updated comment"
    fill_in "Rating", with: 4
    click_on "Update Review"

    assert_text "Review was successfully updated"
    click_on "Back"
  end

  test "should destroy Review" do
    visit book_review_url(@book, @review)
    click_on "Destroy this review", match: :first

    assert_text "Review was successfully destroyed"
  end
end
