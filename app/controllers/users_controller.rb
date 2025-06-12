class UsersController < ApplicationController
  def new
    @user = User.new
    render "auth/signup"
  end
  def show
    @user = User.find_by(id: params[:id])
    unless @user
      redirect_to root_path, alert: "User not found."
    end
  end

   def profile
    @user = current_user
    unless @user
      redirect_to login_path, alert: "Please login to view your profile."
    end
  end


  def create
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
