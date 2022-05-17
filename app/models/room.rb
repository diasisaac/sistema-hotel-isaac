class Room < ApplicationRecord
  has_many :booking, dependent: :destroy
  has_many :user, through: :booking
  validates :name, presence:true
  validates :price, presence:true
  validates :detail, presence:true
  def self.avail_rooms(check_in, check_out)
    bookings = Booking.where("Date(check_in) < ? AND Date(check_out) > ? ", check_out, check_in).collect(&:room_id)
    !bookings.empty? ? Room.where.not(:id => bookings) : Room.all
  end
end
