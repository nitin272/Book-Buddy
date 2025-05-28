require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one) 

    post login_path, params: { email: @user.email, password: 'password' }
  end

  test "should get index" do
    get dashboard_index_url
    assert_response :success
  end
end
