class LocationsController < ApplicationController
  before_filter :find_location, :except => [:index, :new, :create]

  def index
    @locations = Location.all

    respond_to do |format|
      format.html
      format.json { render :json => json_for(@locations) }
    end
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(params[:location])
    if @location.save
      flash[:notice] = "Successfully created location."
      redirect_to @location
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @location.update_attributes(params[:location])
      flash[:notice] = "Successfully updated location."
      redirect_to @location
    else
      render :action => 'edit'
    end
  end

  def show
  end

  def destroy
    @location.destroy
    flash[:notice] = "Successfully destroyed location."
    redirect_to locations_url
  end

  private
  def find_location
    @location = Location.find_by_permalink(params[:id])
  end

  def json_for(locations)
    locations.map do |location|
      { :title        => location.title,
        :longitude    => location.lon,
        :latitude     => location.lat,
        :url          => location_path(location),
        :photo        => File.join(root_path, "images", "horses", location.permalink + ".jpg"),
        :photos_count => location.photos.length
         }
       end.to_json
     end
   end
