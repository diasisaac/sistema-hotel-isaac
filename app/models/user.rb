class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { Cliente: 0, Funcionario: 1, Admin: 2 }
  after_initialize :set_default_role, :if => :new_record?
  validates :cpf, length: {is: 11}, presence: true, uniqueness: true, numericality: { only_integer: true }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }, length: {minimum: 5, too_short: "Tamanho minimo 5 caracteres ", maximum: 50, too_long: "Tamanho maximo 50 caracteres" }

  def set_default_role
    self.role ||= :user
  end
end
