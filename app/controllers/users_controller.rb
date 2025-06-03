class UsersController < ApplicationController
  def new
    @user = User.new
    render "auth/signup"  # renders app/views/auth/signup.html.erb
  end

  def create
    # Check if user with email already exists
    existing_user = User.find_by(email: user_params[:email])

    if existing_user
      flash[:alert] = "Email already exists, please login."
      redirect_to login_path
    else
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to dashboard_path, notice: "Successfully signed up!"
      else
        render "auth/signup", status: :unprocessable_entity
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
