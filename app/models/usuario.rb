class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cliente

  enum funcao: [:cliente, :funcionario, :admin]
  after_initialize :set_default_funcao, :if => :new_record?

  def set_default_funcao
    self.funcao ||= :usuario
  end
end
