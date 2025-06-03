class SessionsController < ApplicationController
  def new
    render "auth/login"
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path, notice: "Successfully logged in!"
    else
      flash.now[:alert] = "Invalid email or password"
      render "auth/login", status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out successfully!"
  end
end
