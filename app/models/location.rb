class Location < ActiveRecord::Base
  # hackers love mass assignment
  attr_accessible :title, :desc, :lat, :lon, :artist, :artist_location, :sponsor
  
  has_many :users
  has_many :photos, :through => :users
  
  
end
