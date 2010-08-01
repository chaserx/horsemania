class Location < ActiveRecord::Base
  # hackers love mass assignment
  attr_accessible :title, :desc, :lat, :lon, :artist, :artist_location, :sponsor

  has_many :photos
  has_many :users, :through => :photos
end
