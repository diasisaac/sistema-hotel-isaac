class Quarto < ApplicationRecord
  validates :nome, :andar, :capacidade, :diaria, presence: true
  validates_numericality_of :andar, :capacidade, :diaria
end
