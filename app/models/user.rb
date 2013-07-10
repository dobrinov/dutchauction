class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :name, :surname

  has_secure_password

  # Associations
  has_many :auction_participations
  has_many :auctions, :through => :auction_participations

  # States
  state_machine :state, :initial => :new do

    state :new
    state :awaiting_confirmation
    state :confirmed
    state :active
    state :disabled
    state :banned

    event :wait_for_confirmation do
      transition [:new] => :awaiting_confirmation
    end

    event :confirm do
      transition [:awaiting_confirmation] => :confirmed
    end

    event :activate do
      transition [:new, :awaiting_confirmation, :confirmed, :disabled, :banned] => :active
    end

    event :disable do
      transition [:active] => :disabled
    end

    event :ban do
      transition [:active] => :banned
    end

  end

  # Validations
  # Class methods
  # Instance methods
end