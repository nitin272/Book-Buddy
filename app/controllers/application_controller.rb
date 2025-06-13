class ApplicationController < ActionController::Base
  allow_browser versions: :modern  # optional, based on your setup

  helper_method :current_user, :logged_in?

  before_action :set_current_user
  before_action :check_session_expiry
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found
  rescue_from ActionController::InvalidAuthenticityToken, with: :handle_invalid_token

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def require_login
    unless logged_in?
      store_location
      redirect_to login_path, alert: "You must be logged in to access this section"
    end
  end

  private

  def set_current_user
    Current.user = current_user
  end

  def check_session_expiry
    if session[:expires_at].present? && session[:expires_at] < Time.current
      reset_session
      redirect_to login_path, alert: "Your session has expired. Please log in again."
    end
  end

  def store_location
    session[:return_to] = request.fullpath if request.get?
  end

  def handle_not_found
    redirect_to root_path, alert: "The requested resource was not found."
  end

  def handle_invalid_token
    reset_session
    redirect_to login_path, alert: "Your session has expired. Please log in again."
  end
end
