require "application_system_test_case"

class ReviewsTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)  # from users.yml
    @book = books(:one)
    @review = reviews(:one)

    log_in_as(@user)     # log in before each test
  end

  def log_in_as(user)
    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"  # match test password
    click_button "Log in"
    assert_text "Welcome"  # or whatever text appears after login
  end

  test "should create review" do
    visit new_book_review_path(@book)
    fill_in "Rating", with: 5
    fill_in "Comment", with: "Amazing!"
    click_button "Create Review"

    assert_text "Review was successfully created"
  end

  test "should update review" do
    visit edit_book_review_path(@book, @review)
    fill_in "Comment", with: "Updated Comment"
    click_button "Update Review"

    assert_text "Review was successfully updated"
  end

  test "should destroy review" do
    visit book_review_path(@book, @review)
    accept_confirm do
      click_button "Destroy this review"
    end

    assert_text "Review was successfully destroyed"
  end
end
