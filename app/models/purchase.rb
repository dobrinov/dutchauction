class Purchase < ActiveRecord::Base
  attr_accessible :amount

  # Associations
  belongs_to :auction

  # Validations
  # Class methods
  # Instance methods
end