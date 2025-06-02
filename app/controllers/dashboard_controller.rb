class DashboardController < ApplicationController
   before_action :require_login
  def index
    # Assuming you have a current_user helper method to get logged-in user
    @user = current_user

    # Make sure @books is set to the user's books (empty array if none)
    @books = @user ? @user.books.order(created_at: :desc) : []
  end
end
