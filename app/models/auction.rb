class Auction < ActiveRecord::Base
  attr_accessible :title, :description

  # Associations
  has_many :purchases

  has_many :auction_participations
  has_many :users, :through => :auction_participations

  # States
  state_machine :state, :initial => :new do

    state :new
    state :scheduled
    state :running
    state :paused
    state :stopped
    state :finished

    event :schedule do
      transition [:new] => :scheduled
    end

    event :start do
      transition [:paused, :scheduled] => :running
    end

    event :pause do
      transition [:running] => :paused
    end

    event :stop do
      transition [:running] => :stopped
    end

    event :finish do
      transition [:paused, :running] => :finished
    end

  end

  # Validations
  # Class methods
  # Instance methods
end