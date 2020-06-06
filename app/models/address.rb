class Address < ApplicationRecord
  belongs_to :location

  def full_address
    "#{self.street} #{self.city}, #{self.state} #{self.zip}"
  end

  validates :street, :city, :state, presence: true
  validates :zip, numericality: true

end
