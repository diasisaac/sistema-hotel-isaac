class Quarto < ApplicationRecord
  validates :nome, :capacidade, :andar, :diaria, :descricao, presence: true
  validates_numericality_of :capacidade, :diaria

  has_many :reservas
  has_many :clientes, through: :reservas
end
