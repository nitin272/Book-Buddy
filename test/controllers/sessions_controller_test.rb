require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one) # Make sure you have a fixture user :one with known email/password
  end

  test "should create session with valid credentials" do
    post login_path, params: { email: @user.email, password: "nitin" }
    assert_response :redirect
    assert_redirected_to dashboard_path
  end

  test "should not create session with invalid credentials" do
    post login_path, params: { email: @user.email, password: "wrongpassword" }
    assert_response :unprocessable_entity
  end
end
