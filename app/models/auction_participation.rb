class AuctionParticipation < ActiveRecord::Base

  # Associations
  belongs_to :auction
  belongs_to :user

  # States
  state_machine :state, :initial => :registered do

    state :registered
    state :active
    state :in_purchase_workflow
    state :canceled
    state :bought
    state :timed_out

    event :activate do
      transition [:registered] => :active
    end

    event :enter_purchase_workflow do
      transition [:active] => :in_purchase_workflow
    end

    event :cancel do
      transition [:in_purchase_workflow] => :canceled
    end

    event :buy do
      transition [:in_purchase_workflow] => :bought
    end

    event :timeout do
      transition [:in_purchase_workflow] => :timed_out
    end

  end
  
  # Validations
  # Class methods
  # Instance methods
end