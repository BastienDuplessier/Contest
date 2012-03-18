class Picture < ActiveRecord::Base
  # Relationship
  belongs_to :user
  
  # Image attached
  has_attached_file :image
end