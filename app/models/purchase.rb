class Purchase < ActiveRecord::Base
  attr_accessible :amount

  # Associations
  belongs_to :auction

  # States
  state_machine :state, :initial => :new do

    state :new
    state :awaiting_payment
    state :paid
    state :canceled

    event :wait_for_payment do
      transition [:new] => :awaiting_payment
    end

    event :pay do
      transition [:awaiting_payment] => :paid
    end

    event :cancel do
      transition [:awaiting_payment] => :canceled
    end

  end

  # Validations
  # Class methods
  # Instance methods
end