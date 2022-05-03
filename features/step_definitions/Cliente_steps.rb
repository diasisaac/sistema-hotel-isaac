
When('estou cadastrado no sistema com o email {string}, a senha {string} e a confirmação de senha {string}') do |string, string2, string3|
  visit '/usuarios/sign_up'
  fill_in 'usuario[email]', :with => string
  fill_in 'usuario[password]', :with => string2
  fill_in 'usuario[password_confirmation]', :with => string3
  click_button 'Sign up'
end
Given('estou na pagina de criar um novo cliente') do
  visit '/clientes/new'
  expect(page).to have_current_path('/clientes/new')
end

When('eu preencho o nome {string}, a data de nascimento {string}, o cpf {string}, o email {string}') do |nome, dataNascimento, cpf, email|
  fill_in 'cliente[nome]', :with => nome
  fill_in 'cliente[data_de_nascimento]', :with => dataNascimento
  fill_in 'cliente[cpf]', :with => cpf
  fill_in 'cliente[email]', :with => email
  click_button 'Create Cliente'
end


Then('eu vejo uma mensagem de cpf invalido') do
  expect(page).to have_content("Cpf is the wrong length")
end

