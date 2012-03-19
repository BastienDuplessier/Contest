class Picture < ActiveRecord::Base
  # Relationship
  belongs_to :user
  
  # Image attached
  has_attached_file :image, :default_url => "/assets/missing.png",
                  :url  => "/assets/images/:user_id/:basename.:extension",
		:path => ":rails_root/public/assets/images/:user_id/:basename.:extension"
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/bmp']
end