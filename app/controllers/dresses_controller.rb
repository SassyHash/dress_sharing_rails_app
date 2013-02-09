class DressesController < ApplicationController
  def new
    @dress= Dress.new
  end

  def create
    photo_file = params[:dress].delete(:photo)
    photo_blob = photo_file.nil? ? nil : photo_file.read

    @dress = Dress.new(params[:dress])
    @dress.photo_blob = photo_blob
    @dress.owner_id = session[:current_user_id]

    if @dress.save!
      flash[:notices] = [] unless flash[:notices]
      flash[:notices] << "Your dress is hung in our closet!"
      redirect_to dress_path(@dress)
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
    dress = Dress.find(params[:id])
    dress.destroy
    redirect_to dresses_path
  end

  def index
   @dresses = Dress.all
  end

  def show
    @dress = Dress.find(params[:id])
  end

  def photo
    dress = Dress.find(params[:id])
    if dress.photo_blob
      send_data dress.photo_blob, :type => 'image/jpg', :disposition => 'inline'
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

end
