class User < ActiveRecord::Base
  
  # authlogic
  acts_as_authentic
  
  has_many :photos
end
