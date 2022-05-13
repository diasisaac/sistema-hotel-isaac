class Quarto < ApplicationRecord
  validates :nome, :capacidade, :andar, :diaria, :descricao, presence: true
  validates_numericality_of :capacidade, :diaria

  has_many :reservas
  has_many :clientes, through: :reservas

  def available_between?(date_begin, date_end)
    conflicting_bookings = self.bookings.where.not("(date_begin < :requested_start_date AND date_end < :requested_start_date) OR (date_end > :requested_end_date AND date_end > :requested_end_date)", requested_start_date: date_begin, requested_end_date: date_end)
    return (date_begin..date_end).all? do |day|
      num_bookings_for_day = conflicting_bookings.select{|booking| booking.date_begin <= day && booking.date_end >= day}.count
      num_bookings_for_day < self.places
    end
  end

  def validate_other_booking_overlap
    sql = "daterange(start_date, end_date, '[]') && daterange(:start_date, :end_date, '[]')"
    is_overlapping = Booking.where(sql, start_date: c.start_date, end_date: c.end_date).exists?
    errors.add(:overlaps_with_other) if is_overlapping
  end
end
