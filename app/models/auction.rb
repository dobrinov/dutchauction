class Auction < ActiveRecord::Base
  attr_accessible :title, :description,
                  :start_price, :end_price, :current_price, :store_price,
                  :start_quantity, :current_quantity,
                  :minimum_users_per_product, :maximum_users_per_product,
                  :time_for_purchase # in seconds

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