class Auction < ActiveRecord::Base
  attr_accessible :title, :description,
                  :start_price, :end_price, :current_price, :store_price,
                  :start_quantity, :current_quantity,
                  :minimum_users_per_product, :maximum_users_per_product,
                  :time_for_purchase, # in seconds
                  :start_datetime,
                  :active_users_timeout
  # Associations
  has_many :purchases

  has_many :auction_participations
  has_many :users, :through => :auction_participations

  # States
  state_machine :state, :initial => :unscheduled do

    state :unscheduled
    state :scheduled
    state :running
    state :waiting_for_active_users
    state :reached_lowest_price
    state :terminated
    state :sold_out

    event :schedule do
      transition [:unscheduled] => :scheduled
    end

    event :unschedule do
      transition [:scheduled] => :unscheduled
    end

    event :start do
      transition [:waiting_for_active_users, :scheduled] => :running
    end

    event :wait_for_active_users do
      transition [:running] => :waiting_for_active_users
    end

    event :reach_lowest_price do
      transition [:running] => :reached_lowest_price
    end

    event :terminate do
      transition [:running] => :terminated
    end

    event :sell_out do
      transition [:running] => :sold_out
    end

  end

  # Callbacks
  before_save :default_values

  # Validations
  # Class methods
  # Instance methods

  def active_users_count
    auction_participations.active.count
  end

  def inactive_users_count
    auction_participations.inactive.count
  end

  def users_count
    auction_participations.count
  end

  def minimum_active_users_count
    minimum_users_per_product * current_quantity
  end

  def seconds_till_start
    (start_datetime - Time.now).to_i
  end

  private 

  def default_values
    self.current_price    ||= self.start_price
    self.current_quantity ||= self.start_quantity
  end
end