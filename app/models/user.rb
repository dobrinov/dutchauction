class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :name, :surname

  has_secure_password

  # Associations
  # Validations
  # Class methods
  # Instance methods
end