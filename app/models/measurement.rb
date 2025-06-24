class Measurement < ApplicationRecord
  belongs_to :meter

  validates :value_kwh, presence: true
  validates :recorded_at, presence: true
end
