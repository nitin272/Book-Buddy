class DashboardController < ApplicationController
   before_action :require_login
  def index
    @user = current_user

    @books = @user ? @user.books.order(created_at: :desc) : []
  end
end
