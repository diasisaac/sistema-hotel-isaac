class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :check_in, :check_out, :guests,  presence: true

  validates_associated :room
  validates_associated :user
end
