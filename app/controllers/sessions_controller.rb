class SessionsController < ApplicationController
  before_filter :current_user, :except => [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:user][:email].downcase)
    if @user && @user.authenticate(params[:user][:password])
      @session_token = SecureRandom.base64
      @user.session_token = @session_token
      @user.save!
      session[:current_user_id] = @user.id
      session[:session_token] = @session_token
      redirect_to user_path(@user)
    else
      flash[:error]= "Invalid email/password"
      render 'new'
    end
  end

  def destroy
    @user = User.find_by_session_token(session[:session_token])
    @user.log_out
    session[:session_token] = nil
    redirect_to 'new'
  end

end
