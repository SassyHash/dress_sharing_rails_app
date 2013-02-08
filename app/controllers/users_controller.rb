class UsersController < ApplicationController
  def new
    @user= User.new
  end

  def create
    @user = User.new
  end

  def edit
    @user = User.find(session[:current_user])
  end

  def update
    @user = User.find(session[:current_user])
  end

  def destroy
    @user = User.find(session[:current_user])
  end

  def index
   @users = User.all
  end

  def show
    @user = User.find(session[:current_user])
  end

end
