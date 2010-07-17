class Location < ActiveRecord::Base
  attr_accessible :title, :desc, :lat, :lon, :artist, :artist_location, :sponsor
  
  has_many :photos
  
  acts_as_polymorphic_paperclip 
end
