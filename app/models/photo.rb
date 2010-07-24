class Photo < ActiveRecord::Base
  attr_accessible :title
  attr_protected :upload_file_name, :upload_content_type, :upload_size
  
  has_attached_file :upload, :styles => { :tiny => "64x64#", :small => "150x150>", :medium => "630x630>", :large => "1024x1024>"  },
                    :url  => "/assets/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  validates_attachment_presence :upload
  validates_attachment_size :upload, :less_than => 1.megabytes
  validates_attachment_content_type :upload, :content_type => ['image/jpeg']
  
  belongs_to :user
  belongs_to :location
  
end
