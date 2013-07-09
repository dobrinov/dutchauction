class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :name, :surname

  has_secure_password

  # Associations
  has_many :auction_participations
  has_many :auctions, :through => :auction_participations

  # Validations
  # Class methods
  # Instance methods
end