require "application_system_test_case"

class ReviewsTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    @book = books(:one)
    @review = reviews(:one)

    log_in_as(@user)
  end

  def log_in_as(user)
    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "nitin"
    click_on "Login"
  end

  test "visiting the book page shows reviews" do
    visit book_path(@book)
    assert_selector "h1", text: @book.title
    assert_selector ".reviews-section"
  end

  test "should create review" do
    visit book_path(@book)
    click_on "Add Review"

    fill_in "Comment", with: "Excellent book!"
    select "5", from: "Rating"
    click_on "Create Review"

    assert_text "Review was successfully created"
    assert_selector ".review-card", text: "Excellent book!"
  end

  test "should update Review" do
    visit book_path(@book)
    within ".review-card" do
      click_on "Edit"
    end

    fill_in "Comment", with: "Updated comment"
    select "4", from: "Rating"
    click_on "Update Review"

    assert_text "Review was successfully updated"
    assert_selector ".review-card", text: "Updated comment"
  end

  test "should destroy Review" do
    visit book_path(@book)
    within ".review-card" do
      accept_confirm do
        click_on "Delete"
      end
    end

    assert_text "Review was successfully deleted"
    assert_no_selector ".review-card", text: @review.comment
  end

  test "should not allow unauthorized user to edit review" do
    # Log out current user
    click_on "Logout"
    
    # Log in as different user
    other_user = users(:two)
    log_in_as(other_user)
    
    visit book_path(@book)
    assert_no_selector "a", text: "Edit"
  end
end
