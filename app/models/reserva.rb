class Reserva < ApplicationRecord
  belongs_to :quarto
  belongs_to :cliente


  validates :check_in, :checkout, :numero_adultos, :numero_criancas, presence: true
  validates_numericality_of :numero_criancas, :numero_adultos
  accepts_nested_attributes_for :quarto, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :cliente, reject_if: :all_blank, allow_destroy: true

  validate :validar_data_checkin
  validate :validar_data_checkout


  validates_associated :quarto
  validates_associated :cliente

  validates :quarto_id, uniqueness: {scope: :quarto_id, message:"Já existe reserva para este quarto" }

  def validar_data_checkin
    if  check_in.present? && check_in <= Time.zone.today
      errors.add(:check_in, " A data deve ser de amanha ou posterior")
    end
  end

  def validar_data_checkout
    if checkout.present? && checkout <= check_in
      errors.add(:checkout, "Checkout invalido - deve ser um dia após o checkin")
    end
  end
end
