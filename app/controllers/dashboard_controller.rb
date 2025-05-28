class DashboardController < ApplicationController
  def index
    @user = current_user
    unless @user
      redirect_to login_path, alert: "Please log in first"
    end
  end
end
