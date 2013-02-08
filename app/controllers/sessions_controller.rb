class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate?
      session[:current_user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error]= "Invalid email/password"
      render 'new'
  end

  def destroy
    @user = User.find(session[:current_user_id])
    @user.log_out
    redirect_to 'new'
  end

end
