require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_path
    assert_response :success
  end

  test "should create" do
    post login_path, params: { email: "user@example.com", password: "password" }
    assert_response :redirect
  end

  test "should get destroy" do
    get logout_path
    assert_response :redirect
  end
end
