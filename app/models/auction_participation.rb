class AuctionParticipation < ActiveRecord::Base

  # Associations
  belongs_to :auction
  belongs_to :user
  
  # Validations
  # Class methods
  # Instance methods
end