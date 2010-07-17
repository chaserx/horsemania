class Location < ActiveRecord::Base
  attr_accessible :title, :desc, :lat, :lon, :artist, :artist_location, :sponsor
end
