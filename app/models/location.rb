class Location < ApplicationRecord
  belongs_to :trip
  has_many :addresses, dependent: :destroy

  validates :name, uniqueness:true
  validates :days, numericality: true
end
