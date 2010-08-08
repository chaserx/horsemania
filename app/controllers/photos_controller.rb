class PhotosController < ApplicationController
  before_filter :set_location
  before_filter :login_required, :except => :index

  def index
    @photos = @location.photos.paginate :page => params[:page], :order => 'updated_at DESC'
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = @location.photos.build(params[:photo])

    @photo.user = current_user

    if @photo.save
      flash[:notice] = "Successfully created photo."
      redirect_to location_photo_path(@location, @photo)
    else
      redirect_to location_path(@location)
    end
  end

  def edit
    begin
      @photo = current_user.photos.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      flash[:error] = "This is not your photo to edit!"
      redirect_to location_path(@location)
    end
  end

  def update
    begin
      @photo = current_user.photos.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      flash[:error] = "This is not your photo to edit!"
      redirect_to location_path(@location)
    end

    if @photo.update_attributes(params[:photo])
      flash[:notice] = "Successfully updated photo."
      redirect_to @photo
    else
      render :action => 'edit'
    end
  end

  def show
    @photo = @location.photos.find(params[:id])
  end

  def destroy
    begin
      @photo = current_user.photos.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      flash[:error] = "This is not your photo to delete!"
      redirect_to location_path(@location)
    end

    @photo.destroy
    flash[:notice] = "Successfully destroyed photo."
    redirect_to locations_url
  end

  private
    def set_location
      @location = Location.find_by_permalink(params[:location_id])
    end
end
