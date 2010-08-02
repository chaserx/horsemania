class Location < ActiveRecord::Base
  # hackers love mass assignment
  attr_accessible :title, :desc, :lat, :lon, :artist, :artist_location, :sponsor

  has_many :photos
  has_many :users, :through => :photos

  before_save :create_permalink

  def to_param
    self.permalink
  end

  private
  def create_permalink
    self.permalink = self.title.parameterize.to_s
  end
end
