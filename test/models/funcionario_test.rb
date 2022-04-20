require "test_helper"

class FuncionarioTest < ActiveSupport::TestCase
  test "criando funcionario" do
    funcionarios = Funcionario.new(nome: 'Carlos Andre', cpf: '98765432111', email: 'Carlos@gmail.com',cargo:'Gerente')
    assert funcionarios.save
  end
  test "criando funcionario sem nome" do
    funcionarios = Funcionario.new(nome: '', cpf: '98765432111', email: 'Carlos@gmail.com',cargo:'Gerente')
    assert_not funcionarios.save
  end
  test "editanto funcionario" do
    funcionarios = Funcionario.new(nome: 'Carlos Andre', cpf: '98765432111', email: 'Carlos@gmail.com',cargo:'Gerente')
    funcionarios.save
    assert funcionarios.update(nome: 'João Paulo', cpf: '98765432111', email: 'Carlos@gmail.com',cargo:'Gerente')
  end
end
