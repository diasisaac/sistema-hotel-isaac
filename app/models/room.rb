class Room < ApplicationRecord
  has_many :booking, dependent: :destroy
  has_many :user, through: :booking
end
