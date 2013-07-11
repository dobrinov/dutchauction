class AuctionParticipation < ActiveRecord::Base

  # Associations
  belongs_to :auction
  belongs_to :user

  # States
  # state_machine :state, :initial => :new do

  #   state :new
  #   state :active
  #   state :in_purchase_flow
  #   state :timed_out
  #   state :insufficient_funds
  #   state :terminated
  #   state :bought

  # end
  
  # Validations
  # Class methods
  # Instance methods
end