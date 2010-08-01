class User < ActiveRecord::Base

  # authlogic
  acts_as_authentic

  has_many :photos
  has_many :locations, :through => :photos
end
