require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    post login_path, params: { email: @user.email, password: "Nitin@11" }
  end

  test "should get index" do
    get dashboard_index_url
    assert_response :success
  end
end
