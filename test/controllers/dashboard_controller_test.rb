require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    post login_path, params: { email: "nitinsoni95092@gmail.com", password: "nitin" }
  end

  test "should get index" do
    get dashboard_path
    assert_response :success
  end
end
