class UsersController < ApplicationController
  def new
    @user= User.new
  end

  def create
    @user = User.new
    @user.update_attributes(params[:user])
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
