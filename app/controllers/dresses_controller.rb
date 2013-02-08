class DressesController < ApplicationController
  def new
    @dress= Dress.new
  end

  def create
    @dress = User.new
    @dress.update_attributes(params[:dress])
    if @dress.save!
      render 'show'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @dress = Dress.find(params[:dress][:id])
  end

  def destroy
    @dress = Dress.find(params[:dress][:id])
  end

  def index
   @dresses = Dress.all
  end

  def show
    @dress = Dress.find(params[:dress][:id])
  end


end
