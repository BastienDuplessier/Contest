class User < ActiveRecord::Base
  # Relationship
  has_many :picture
  
  # Validations
  validates :email, :presence => true, :uniqueness => true, :format => { :with => /^([a-zA-Z0-9_-])+([.]?[a-zA-Z0-9_-]{1,})*@([a-zA-Z0-9-_]{2,}[.])+[a-zA-Z]{2,3}$/i }
end
