class Unit < ApplicationRecord
  belongs_to :house

  has_many :meters
end
