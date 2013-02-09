class ApplicationController < ActionController::Base
  before_filter :current_user
  protect_from_forgery
  include SessionsHelper

  def current_user
    @current_user ||= User.find_by_session_token(session[:sesion_token])
  end

  def require_log_in
    if logged_in?
    else
      redirect_to new_sessions_path
    end
  end

  def logged_in?
    !!current_user
  end
end

