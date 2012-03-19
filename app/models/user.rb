class User < ActiveRecord::Base
  # Relationship
  has_many :picture
  
  # Validations
  validates :email, :presence => true, :uniqueness => true, :format => { :with => /^([a-z0-9_-])+([.]?[a-z0-9_-]{1,})*@([a-z0-9-_]{2,}[.])+[a-z]{2,3}$/i }
end