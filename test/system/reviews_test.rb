require "application_system_test_case"

class ReviewsTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    @book = books(:one)
    @review = reviews(:one)

    log_in_as(@user)
  end

  def log_in_as(user)
  page.driver.post login_path, params: { email: user.email, password: "nitin" }
  visit dashboard_path  # redirect target after login, so load that page to set session in browser
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
