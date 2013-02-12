class ApplicationController < ActionController::Base
  protect_from_forgery
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

  include SessionsHelper

  def current_user
    if session[:sesion_token].nil?
      if params[:apikey].nil?
        nil
      else
        @current_user = User.find_by_apikey(params[:apikey])
      end
    else
      @current_user ||= User.find_by_session_token(session[:sesion_token])
    end
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

