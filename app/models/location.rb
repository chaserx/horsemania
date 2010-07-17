class Location < ActiveRecord::Base
  # hackers love mass assignment
  attr_accessible :title, :desc, :lat, :lon, :artist, :artist_location, :sponsor
  
  # not sure about this
  has_many :photos
  
  # for paperclippolymorph plugin
  # how to use s3?
  acts_as_polymorphic_paperclip 
end
