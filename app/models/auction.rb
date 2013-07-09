class Auction < ActiveRecord::Base
  attr_accessible :title, :description

  # Associations
  has_many :purchases

  has_many :auction_participations
  has_many :users, :through => :auction_participations

  # Validations
  # Class methods
  # Instance methods
end