class UsersController < ApplicationController
  def new
    @user= User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      @user.update_attributes(:session_token => SecureRandom.base64)
      session[:current_user_id] = @user.id
      session[:session_token] = @user.session_token
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(session[:current_user_id])
  end

  def update
    @user = User.find(session[:current_user_id])
  end

  def destroy
    @user = User.find(session[:current_user_id])
  end

  def index
   @users = User.all
  end

  def show
    @user = User.find(session[:current_user_id])
  end

end
