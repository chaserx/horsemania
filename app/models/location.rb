class Location < ActiveRecord::Base
  attr_accessible :title, :desc, :lat, :lon
end
