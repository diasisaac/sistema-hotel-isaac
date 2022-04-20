class Cliente < ApplicationRecord
  validates :nome, presence: true, length: {minimum: 5, too_short: "tamanho minimo 3 caracteres "}
  validates :cpf, length: {is: 11}, presence: true, uniqueness: true, numericality: { only_integer: true }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }, length: {minimum: 5, too_short: "Tamanho minimo 5 caracteres ", maximum: 50, too_long: "Tamanho maximo 50 caracteres" }
  validates :data_de_nascimento, presence: true
  validate :validar

  has_many :reservas
  has_many :quartos, through: :reservas

  def validar
    if data_de_nascimento.present? && data_de_nascimento > Time.zone.today
      errors.add(:data_de_nascimento, "Data invalida")
    end
  end
end
