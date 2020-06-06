class Trip < ApplicationRecord
  validates :name, presence: true
  has_many :locations, dependent: :destroy

  validates :name, presence: true
end
