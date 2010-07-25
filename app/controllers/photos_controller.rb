class PhotosController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @photos = current_user.photos.paginate :page => params[:page], :order => 'updated_at DESC'
    else
      @photos = Photo.paginate :page => params[:page], :order => 'updated_at DESC'
      @user = User.all
    end
  end
  
  def new
    @photo = Photo.new
  end
  
  def create
    @photo = Photo.new(params[:photo])
    @photo = current_user.photos.create(params[:photo])
    if @photo.save
      flash[:notice] = "Successfully created photo."
      redirect_to @photo
    else
      render :action => 'new'
    end
  end
  
  def edit
    @photo = Photo.find(params[:id])
  end
  
  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(params[:photo])
      flash[:notice] = "Successfully updated photo."
      redirect_to @photo
    else
      render :action => 'edit'
    end
  end
  
  def show
    @photo = Photo.find(params[:id])
  end
  
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = "Successfully destroyed photo."
    redirect_to photos_url
  end
end
