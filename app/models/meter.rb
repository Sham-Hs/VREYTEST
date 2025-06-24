class Meter < ApplicationRecord
  belongs_to :unit

  validates :location_id, presence: true 

  enum :type, {market_location: 0 ,metering_location: 1}

end
